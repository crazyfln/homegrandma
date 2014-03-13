# == Schema Information
#
# Table name: contact_us
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  phone      :string(255)
#  email      :string(255)
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe ContactUs do

  describe "Table Column" do
    it { should have_db_column(:id) }
    it { should have_db_column(:name) }
    it { should have_db_column(:phone) }
    it { should have_db_column(:email) }
    it { should have_db_column(:message) }
  end

  describe "Validation" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:email) }

    it { should allow_value('me@gmail.com', 'me123@gmail.com').for(:email) }
    it { should_not allow_value('me!@gmail.com', 'me123gmail.com', 'me123gmailcom').for(:email) }

  end

end
