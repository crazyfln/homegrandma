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

FactoryGirl.define do
  factory :state do
    code              { Faker::Adrress.state_abbr }
    name              { Faker::Adrress.state }
  end
end
