# == Schema Information
#
# Table name: properties
#
#  id                      :integer          not null, primary key
#  user_id                 :integer
#  name                    :string(255)
#  address                 :string(255)
#  state_code              :string(255)
#  zip                     :string(255)
#  city                    :string(255)
#  phone_number            :string(255)
#  phone_number_2          :string(255)
#  types                   :text
#  description             :text
#  latitude                :float
#  longitude               :float
#  created_at              :datetime
#  updated_at              :datetime
#  license_number          :string(255)
#  capacity                :integer
#  care_services           :string(255)
#  feature_and_amenities   :string(255)
#  dinnings                :string(255)
#  buy_in_fee              :string(255)
#  add_person_fee          :string(255)
#  community_fee           :string(255)
#  respite_fee             :string(255)
#  caregivers_languages_1  :string(255)
#  caregivers_languages_2  :string(255)
#  resident_ethnics_1      :string(255)
#  resident_ethnics_2      :string(255)
#  property_manager_avatar :string(255)
#  vacancies               :string(255)
#  property_manager_name   :string(255)
#  include_service_charge  :boolean          default(FALSE)
#  accept_ssi              :boolean          default(FALSE)
#

FactoryGirl.define do
  factory :property do
    association               :user,      factory: :user
    name                      {Faker::Name.name}
    property_manager_name     {Faker::Name.name}
    address                   {Faker::AddressUS.street_address}
    state_code                {State.all.map(&:code).sample}
    zip                       {Faker::AddressUS.zip_code}
    city                      {Faker::AddressUS.city}
    phone_number              {Faker::PhoneNumber.phone_number}
    description               {Faker::Lorem.paragraphs.join ' '}
    accept_ssi                {[true, false].sample}
    capacity                  { (1..10).to_a.sample }
    vacancies                 { Faker::Lorem.words.join ' ' }
    types                     { Enum::Property::TYPES[:options].shuffle[0..2] }
    care_services             { Enum::Property::CARE_SERVICES[:options].shuffle[0..2] }
    feature_and_amenities     { Enum::Property::FEATURE_AND_AMENITIES[:options].shuffle[0..2] }
    dinnings                  { Enum::Property::DINNINGS[:options].shuffle[0..2] }
    caregivers_languages_1    { Enum::Property::CAREGIVERS_LANGUAGES[:options].sample }
    caregivers_languages_2    { Enum::Property::CAREGIVERS_LANGUAGES[:options].sample }
    resident_ethnics_1        { Enum::Property::RESIDENT_ETHNICS[:options].sample }

    # factory property with complete data
    factory :property_complete do
      ignore do
        photos_count        (1..5).to_a.sample
        room_types_count    (1..5).to_a.sample
        service_types_count (1..5).to_a.sample
      end

      after(:build) do |property, evaluator|
        property.property_photos            << build_list(:property_photo, evaluator.photos_count, property: property)
        property.property_service_types     << build_list(:property_service_type, evaluator.room_types_count, property: property)
        property.property_room_types        << build_list(:property_room_type, evaluator.room_types_count, property: property)
        property.property_manager_avatar    = File.new("#{Rails.root}/db/images/avatars/#{ (1..10).to_a.sample }.jpg", mode: 'r+')
      end
    end

  end
end
