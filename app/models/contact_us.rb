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

class ContactUs < ActiveRecord::Base

  # validation
  validates :name,      presence: true
  validates :message,   presence: true
  validates :email,     format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, 
                        presence: true

end
