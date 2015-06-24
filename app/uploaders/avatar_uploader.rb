# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::Compatibility::Paperclip
  include Cloudinary::CarrierWave

  version :thumb do
    resize_to_fit(100, 100)
  end

  version :medium do
    resize_to_fit(200, 200)
  end

end
