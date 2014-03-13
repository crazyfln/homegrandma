# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  avatar                 :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  # relationship
  has_many :properties
  has_many :likes

  # return true if this user has been like given property
  # return false if not yet
  #
  def like_property?(property)
    likes.where(property_id: property.id).present?
  end

  # return true if valid (saved successfully)
  def like_property!(property)
    like = likes.new(property: property)
    like.save
  end

  # return true if like is deleted
  def dislike_property!(property)
    like = likes.where(property_id: property.id).first
    if like.present?
      like.destroy
    end
  end
end
