# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::Compatibility::Paperclip
  include Cloudinary::CarrierWave

  version :mini do
    resize_to_fit(50, 50)
  end

  version :thumb do
    resize_to_fit(100, 100)
  end

  version :medium do
    resize_to_fit(200, 200)
  end

end
