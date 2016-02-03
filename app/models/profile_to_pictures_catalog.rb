class ProfileToPicturesCatalog < ActiveRecord::Base
  belongs_to :profile
  belongs_to :picture
end
