module Canteen
  module Liquid
    module Tags
      class FileTag < ::Liquid::Tag

        def initialize(tag_name, name, tokens)
          super
          # FIXE: 1. Fix search using correct model
          @file = Canteen::Product.find_by(name: name).images.first
        rescue
        end

        def render(context)
          # FIXE: 2. Fix search using correct model
          @file.nil? ? "file_not_found" : @file.file_url
        end
      end

      ::Liquid::Template.register_tag('file_tag', FileTag)

    end
  end
end 