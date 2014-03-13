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

FactoryGirl.define do
  factory :property_service_type do
    association     :property,  factory: :property
    name            { Faker::Name.first_name }
    price_start_at  { (100..1000).to_a.sample }
  end
end
