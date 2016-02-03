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

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
