# == Schema Information
#
# Table name: accounts
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  role_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Account < ActiveRecord::Base
  belongs_to :role

  validates :password, confirmation: true
  validates :password, length: {minimum:6}
  validates :password_confirmation, presence: true
  validates :username, length: {minimum: 6}
  validates :username, uniqueness: { case_sensitive: false }

  has_secure_password

end
