# == Schema Information
#
# Table name: property_service_types
#
#  id             :integer          not null, primary key
#  property_id    :integer
#  name           :string(255)
#  price_start_at :decimal(12, 2)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe PropertyServiceType do

  describe "Tabel Column" do
    it { should have_db_column(:id) }
    it { should have_db_column(:property_id) }
    it { should have_db_column(:enable) }
    it { should have_db_column(:name) }
    it { should have_db_column(:price_start_at) }
  end

  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:property_id) }
  end

  describe "assosiation" do
      it { should belong_to(:property) }
  end
end
