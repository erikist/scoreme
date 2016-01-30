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

class Token < ActiveRecord::Base
  before_create :set_up
  
  has_one :account, through: :accounts_to_tokens_catalog
  
  def extend_token
    self.expiration_date = Time.now + 15.days
  end
  
  private
  def set_up
    begin
      self.uuid = SecureRandom.base64(64)
    end while self.class.exists?(uuid: uuid)
    extend_token
  end
end
