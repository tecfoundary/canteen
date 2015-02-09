module Canteen
  module ProductsHelper
  
    def render_markdown(content)
      raw "#{Canteen::Markdown.render(content).html_safe}"
    end
  end
end
