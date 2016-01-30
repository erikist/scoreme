class CreateAccountsToTokensCatalogs < ActiveRecord::Migration
  def change
    create_table :accounts_to_tokens_catalogs do |t|
      t.references :token, index: true, foreign_key: true
      t.references :account, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
