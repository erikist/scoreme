class CreateProfileToPicturesCatalogs < ActiveRecord::Migration
  def change
    create_table :profile_to_pictures_catalogs do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :picture, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
