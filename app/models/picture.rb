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

  before_create :save_to_s3
  
  attr_accessor :image_io
  attr_accessor :folder_name
  attr_accessor :file_name
  
  def save_to_s3
    self.save_to_s3(self.image_io,self.folder_name,self.file_name)
  end

  def save_to_s3(image_io, folder_name, file_name)
    service = AWS::S3.new(:access_key_id => ACCESS_KEY_ID,
    :secret_access_key => SECRET_ACCESS_KEY)
    bucket_name = "scoreme"
    if(service.buckets.include?(bucket_name))
    bucket = service.buckets[bucket_name]
    else
    bucket = service.buckets.create(bucket_name)
    end
    bucket.acl = :public_read
    key = folder_name.to_s + "/" + Time.now.to_formatted_s(:number)  + '_' + file_name
    s3_file = service.buckets[bucket_name].object[key].put(:body => image_io)
    s3_file.acl = :public_read
    self.location = s3_file.public_url.to_s
  end
end
