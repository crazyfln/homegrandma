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

class Message < ActiveRecord::Base

  belongs_to :property

  # validation
  validates :name,                presence: true
  validates :email,               presence: true,
                                  format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :estimated_date,      presence: true
  validates :body,                presence: true
  validates :property,            presence: true

end
