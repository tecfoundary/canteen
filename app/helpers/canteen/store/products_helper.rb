module Canteen
  module Store::ProductsHelper

    def to_size(i)
      case i
      when 1
        'S'
      when 2
        'M'
      when 3
        'L'
      when 4
        'XL'
      when 5
        'XXL'
      end
    end
    
  end
end
