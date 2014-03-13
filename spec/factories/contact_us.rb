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

FactoryGirl.define do
  factory :contact_us do
    name      { Faker::Name.first_name }
    phone     { Faker::PhoneNumber.phone_number }
    email     { Faker::Internet.email }
    message   { Faker::Lorem.paragraph }
  end
end
