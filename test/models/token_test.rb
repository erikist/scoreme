# == Schema Information
#
# Table name: tokens
#
#  id              :integer          not null, primary key
#  uuid            :string(255)
#  expiration_date :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
