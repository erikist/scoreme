# == Schema Information
#
# Table name: accounts_to_tokens_catalogs
#
#  id         :integer          not null, primary key
#  token_id   :integer
#  account_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AccountsToTokensCatalogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
