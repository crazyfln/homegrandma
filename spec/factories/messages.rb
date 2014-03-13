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

FactoryGirl.define do
  factory :message do
    association     :property,  factory: :property
    name            { Faker::Name.first_name }
    email           { Faker::Internet.email }
    estimated_date  { (1..10).to_a.sample.since }
    body            { Faker::Lorem.paragraph }
    claim_reward    { [true, false].sample  }
  end
end
