module Canteen
  module ProductsHelper
  
    def render_markdown(content)
      raw "#{Canteen::Markdown.render(content).html_safe}"
    end

    def row_class(product)
      case 
      when product.showcase?
        return 'success'
      when product.new_arrival?
        return 'info'
      end
    end
  end
end
