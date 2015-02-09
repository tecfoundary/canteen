module Canteen
  class Image
    include Mongoid::Document

    #
    # Uploader
    #

    mount_uploader :file, ImageUploader

    #
    # Associations
    #
    embedded_in :product, polymorphic: true
  end  
end
