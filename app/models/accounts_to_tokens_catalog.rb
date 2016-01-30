class AccountsToTokensCatalog < ActiveRecord::Base
  belongs_to :token
  belongs_to :account
end
