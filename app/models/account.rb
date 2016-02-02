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
  
  has_many :tokens, through: :accounts_to_tokens_catalogs
  has_many :accounts_to_tokens_catalogs
  
  has_one :profile 
  
  validates :password, confirmation: true
  validates :password, length: {minimum:6}
  validates :password_confirmation, presence: true
  validates :username, length: {minimum: 6}
  validates :username, uniqueness: { case_sensitive: false }

  has_secure_password
  
  class << self
    def login(username, password)
      account = Account.find_by username: username
      if(account && account.authenticate(password))
        token = Token.create
        AccountsToTokensCatalog.create({account: account, token: token})
      return account
      end
    end
  end

end
