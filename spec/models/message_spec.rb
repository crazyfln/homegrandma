# == Schema Information
#
# Table name: messages
#
#  id             :integer          not null, primary key
#  property_id    :integer
#  name           :string(255)
#  email          :string(255)
#  estimated_date :date
#  body           :text
#  claim_reward   :boolean
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe Message do

  describe "Table Column" do
    it { should have_db_column(:id) }
    it { should have_db_column(:property_id) }
    it { should have_db_column(:name) }
    it { should have_db_column(:email) }
    it { should have_db_column(:estimated_date) }
    it { should have_db_column(:body) }
    it { should have_db_column(:claim_reward) }
  end

  describe "validation" do
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:email) }
     it { should validate_presence_of(:body) }
     it { should validate_presence_of(:property) }
     it { should validate_presence_of(:estimated_date) }


     it { should allow_value('me@gmail.com', 'me123@gmail.com').for(:email) }
     it { should_not allow_value('me!@gmail.com', 'me123gmail.com', 'me123gmailcom').for(:email) }
  end

  describe "assosiation" do
      it { should belong_to(:property) }
  end
end
