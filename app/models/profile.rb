# == Schema Information
#
# Table name: profiles
#
#  id           :integer          not null, primary key
#  account_id   :integer
#  first_name   :string(255)
#  last_name    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  phone_number :integer
#

class Profile < ActiveRecord::Base
  belongs_to :account
  
  has_many :pictures, through: :profile_to_pictures_catalogs
  has_many :profile_to_pictures_catalogs
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  
end
