module Hicube
  module Liquid
    module Tags
      class ImgTag < ::Liquid::Tag

        def initialize(tag_name, name, tokens)
          super
          @img = Hicube::Document.images.find_by(name: name)
        rescue
        end

        def render(context)
          @img.nil? ? "image_not_found" : @img.image_url
        end
      end

      ::Liquid::Template.register_tag('img_tag', ImgTag)

    end
  end
end 