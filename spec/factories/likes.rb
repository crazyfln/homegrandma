# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  property_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :like do
  end
end
