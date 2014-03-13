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

class PropertyServiceType < ActiveRecord::Base
    # relationship
  belongs_to :property

  # validation
  validates :name,  presence: true,
                    uniqueness: { case_sensitive: false, scope: :property_id }


end
