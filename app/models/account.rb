class Account < ActiveRecord::Base
  belongs_to :role

  validates :password, confirmation: true
  validates :password, length: {minimum:6}
  validates :password_confirmation, presence: true
  validates :username, length: {minimum: 6}
  validates :username, uniqueness: true

  has_secure_password

end
