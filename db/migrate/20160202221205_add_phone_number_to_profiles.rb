class AddPhoneNumberToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :phone_number, :int
  end
end
