# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class State < ActiveRecord::Base

  # validations
  validates :name, presence: true, 
                   uniqueness: { case_sensitive: false }
  validates :code, presence: true, 
                   uniqueness: { case_sensitive: false }
                   
end
