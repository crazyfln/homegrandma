# == Schema Information
#
# Table name: property_photos
#
#  id          :integer          not null, primary key
#  property_id :integer
#  photo       :string(255)
#  primary     :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

FactoryGirl.define do
  factory :property_photo do
    association     :property,  factory: :property
    photo           { File.new("#{Rails.root}/db/images/properties/#{ (1..21).to_a.sample }.jpg", mode: 'r+') }
  end
end
