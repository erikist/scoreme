class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.string :uuid
      t.datetime :expiration_date

      t.timestamps null: false
    end
    add_index :tokens, :uuid, unique: true
  end
end
