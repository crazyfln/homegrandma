require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the PropertiesHelper. For example:
#
# describe PropertiesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe ApplicationHelper do
  describe :javascript do
    it "Javascript must include tag arguments"
    javascript = "blah"
  end

  describe :state_code_to_select do

    it "should return array of array contain state code and id" do
      state_code_to_select.should =~ State.all.map{|s| [s.code, s.id]}
    end
  end

  describe :facility_type_for_select do
    it "Should return array of openstruct" do
      facility_type_for_select.kind_of?(Array).should eq true
      facility_type_for_select.each do | facility |
        facility.class.to_s.should eq "OpenStruct"
      end
    end

    it "Should have method name and text" do
      facility_type_for_select.each do |facility|
        facility.respond_to?(:name).should eq true
        facility.respond_to?(:text).should eq true
      end
    end
  end

  describe :caregivers_languages_for_select do
    it "should return array of openstruct" do
      caregivers_languages_for_select.kind_of?(Array).should eq true
      caregivers_languages_for_select.each do |caregiver|
        caregiver.class.to_s.should eq "OpenStruct"
      end
    end

    it "Should have method name and text" do
      caregivers_languages_for_select.each do |caregiver|
        caregiver.respond_to?(:name).should eq true
        caregiver.respond_to?(:text).should eq true
      end
    end
  end

  describe :resident_ethnics_2_for_select do
    it "should return array of openstruct" do
      resident_ethnics_2_for_select.kind_of?(Array).should eq true
      resident_ethnics_2_for_select.each do |resident|
        resident.class.to_s.should eq "OpenStruct"
      end
    end

    it "should have method name and text" do
      resident_ethnics_2_for_select.each do |resident|
        resident.respond_to?(:name).should eq true
        resident.respond_to?(:text).should eq true
      end
    end
  end

  describe :care_services_for_select do
    it "should return array of openstruct" do
      care_services_for_select.kind_of?(Array).should eq true
      care_services_for_select.each do |care|
        care.class.to_s.should eq "OpenStruct"
      end
    end

    it "should have method name and text" do
      care_services_for_select.each do |care|
        care.respond_to?(:name).should eq true
        care.respond_to?(:text).should eq true
      end
    end
  end

  describe :feature_and_amenities_for_select do
    it "should return array of openstruct" do
      feature_and_amenities_for_select.kind_of?(Array).should eq true
      feature_and_amenities_for_select.each do |feature|
        feature.class.to_s.should eq "OpenStruct"
      end
    end

    it "should have method name and text" do
      feature_and_amenities_for_select.each do |feature|
        feature.respond_to?(:name).should eq true
        feature.respond_to?(:text).should eq true
      end
    end
  end

  describe :dinnings_for_select do
    it "should return array of openstruct" do
      dinnings_for_select.kind_of?(Array).should eq true
      dinnings_for_select.each do |dinning|
        dinning.class.to_s.should eq "OpenStruct"
      end
    end

    it "should have method name and text" do
      dinnings_for_select.each do |dinning|
        dinning.respond_to?(:name).should eq true
        dinning.respond_to?(:text).should eq true
      end
    end
  end

  describe :hash_to_hidden_fields do
    let(:test_hash)  do
      {
        "utf8" => "✓",
        "_method" => "put",
        "something" => {
          "nested1" => "3",
          "nested2" => "4"
        },
        "nil" => nil,
        "array" => [
          1, 2, "3", "abc"
        ],
        "array of hashes" => [
          { "key 1"         => "val 1"        },
          { "ooh, nes<><><ting!" => ["x", "z", "y"]}
        ]
      }
    end

    let(:expected_html_blocks) do
      # It looks bad but if we indent it, it would put white space to our code, and will break the test
      [
'<input id="utf8" name="utf8" type="hidden" value="✓" />',
'<input id="_method" name="_method" type="hidden" value="put" />',
'<input id="something_nested1" name="something[nested1]" type="hidden" value="3" />',
'<input id="something_nested2" name="something[nested2]" type="hidden" value="4" />',
<<-HTML,
<input id="array_" name="array[]" type="hidden" value="1" />
<input id="array_" name="array[]" type="hidden" value="2" />
<input id="array_" name="array[]" type="hidden" value="3" />
<input id="array_" name="array[]" type="hidden" value="abc" />
HTML
'<input id="array_of_hashes__key_1" name="array of hashes[][key 1]" type="hidden" value="val 1" />',
<<-HTML,
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="x" />
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="z" />
<input id="array_of_hashes__ooh__nes_____ting__" name="array of hashes[][ooh, nes&lt;&gt;&lt;&gt;&lt;ting!][]" type="hidden" value="y" />
HTML
      ]
    end
    it "produces the correct tags" do
      expected_html_blocks.map!(&:chomp)
      expected_html_blocks.each do |tags|
        hash_to_hidden_fields(test_hash).should include(tags)
      end
    end
  end

  describe :call_js_init do
    it "content javascript must something js" do
      helper.call_js_init("something();")
      view.content_for(:javascript).should include("something();")
    end
  end


end
