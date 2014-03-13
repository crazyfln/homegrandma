# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  property_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates :user,      presence: true
  validates :property,  presence: true,
                        uniqueness: { scope: 'user_id' }
end
