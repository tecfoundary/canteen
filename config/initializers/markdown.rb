class MultiRenderer < Redcarpet::Render::HTML
  include Redcarpet::Render::SmartyPants
end

module Canteen
  Markdown = Redcarpet::Markdown.new(MultiRenderer)
end
