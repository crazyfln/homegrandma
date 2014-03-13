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

class Property < ActiveRecord::Base
  include ExtProperty::Searchable
  extend Enumerize
  attr_accessor :vacant_vacility, :step # => Used For Multi Page Form


  # serialize attrubutes
  serialize :types, Array
  serialize :dinnings, Array
  serialize :care_services, Array
  serialize :feature_and_amenities, Array

  enumerize :types,                   in: Enum::Property::TYPES[:options],
                                      multiple: true
  enumerize :care_services,           in: Enum::Property::CARE_SERVICES[:options],
                                      multiple: true
  enumerize :feature_and_amenities,   in: Enum::Property::FEATURE_AND_AMENITIES[:options],
                                      multiple: true
  enumerize :caregivers_languages_1,  in: Enum::Property::CAREGIVERS_LANGUAGES[:options]
  enumerize :caregivers_languages_2,  in: Enum::Property::CAREGIVERS_LANGUAGES[:options]
  enumerize :resident_ethnics_1,      in: Enum::Property::RESIDENT_ETHNICS[:options]
  enumerize :resident_ethnics_2,      in: Enum::Property::RESIDENT_ETHNICS[:options]
  enumerize :dinnings,                in: Enum::Property::DINNINGS[:options],
                                      :multiple => true


  mount_uploader :property_manager_avatar, PropertyManagerAvatarUploader

  # relations
  belongs_to  :user
  has_many    :property_room_types
  has_many    :property_service_types
  has_many    :property_photos
  has_many    :messages


  # accept nested attributes
  accepts_nested_attributes_for :property_room_types,     allow_destroy: true, reject_if: Proc.new { |room_type| room_type["name"].blank? && room_type['_destroy'] == 'false' }
  accepts_nested_attributes_for :property_service_types,  allow_destroy: true, reject_if: Proc.new { |service_type| service_type["name"].blank? && service_type['_destroy'] == 'false' }
  accepts_nested_attributes_for :property_photos,         allow_destroy: true, reject_if: Proc.new { |photo| photo["photo"].blank? && photo['_destroy'] == 'false' }


  # Geocoding
  geocoded_by :address
  after_validation :geocode

  # validation
  validates :name,            presence: true
  validates :user,            presence: true
  validates :address,         presence: true
  validates :state_code,      presence: true
  validates :zip,             presence: true
  validates :city,            presence: true
  validates :phone_number,    presence: true
  validates :capacity,        presence: true
  validates :vacancies,       presence: true
  validates :types,           presence: true

  validates :property_manager_name,    presence: true
  validates :property_room_types,      presence: true, if: Proc.new { |p| ((p.step == 2) && p.new_record?)  }
  validates :property_service_types,   presence: true, if: Proc.new { |p| (p.include_service_charge.blank? && (p.step == 2)) || ((p.step == 2) && p.new_record?)}

  # callbacks
  before_save :assign_default_photo

  # return the first room types + service types price
  #
  def price_start_at
    room_type     = property_room_types.first
    service_type  = property_service_types.first

    return BigDecimal("0.0") if (room_type.blank? || service_type.blank?)
    BigDecimal(room_type.price_start_at.to_s) + BigDecimal(service_type.price_start_at.to_s)
  end

  def display_name_and_address
    [name, [address, city, state_code, zip].compact.uniq.join(', ')].join ' - '
  end


  # get primary photo or first photo as default
  # if blank, generate new record photo property (not saved / not persisted)
  #
  def default_photo
    @default_photo ||= if property_photos.present?
      property_photos.where(primary: true).first || property_photos.first
    else
      PropertyPhoto.new
    end
  end


  private

    # when create property, set first photo as primary if still no primary
    # if no photos exists, then leave as it
    #
    def assign_default_photo
      if property_photos.where(primary: true).blank?
        property_photo = property_photos.first
        # if photo exists
        if property_photo.present?
          property_photo.primary = true
          property_photo.save
        end
      end
    end

end
