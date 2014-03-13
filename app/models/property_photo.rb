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

class PropertyPhoto < ActiveRecord::Base
  mount_uploader :photo, PropertyPhotoUploader, :mount_on => :photo
  validates :photo, presence: true

  # relationship
  belongs_to :property
end
