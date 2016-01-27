class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password_digest
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :accounts, :username, unique: true
  end
end
