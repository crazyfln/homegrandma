# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe State do

  describe "Table Column" do
    it { should have_db_column(:id) }
    it { should have_db_column(:code) }
    it { should have_db_column(:name) }
  end

  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }

    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code).case_insensitive }

  end


end
