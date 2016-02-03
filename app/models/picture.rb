# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Picture < ActiveRecord::Base
end
