module Canteen
  class Product
  
    include Mongoid::Document
    include Mongoid::Timestamps

    #
    # Associations
    # 
    embeds_many :images, class_name: 'Canteen::Image' # Photos of products
    accepts_nested_attributes_for :images

    #
    # Fields
    #
    field :sku, type: String

    # Details
    
    field :nm, type: String,
      as:         :name

    field :sp, type: Float,
      as:         :sell_price

    field :cp, type: Float,
      as:         :cost_price

    field :ab, type: DateTime,
      as:         :available_at,
      default:    Time.now

    field :dc, type: Integer,
      as:         :discount,
      default:    0
      
    field :ds, type: String,
      as:         :description

    # Properties

    field :tp, type: String,
      as:         :type

    field :sz, type: String,
      as:         :size

    field :mt, type: String,
      as:         :material


    # Validations
    validates_presence_of   :name, :sku, :sell_price, :cost_price, :description
    validates_uniqueness_of :sku

    public 
    
    def discount?
      self.discount.nil? ? false : self.discount > 0
    end
  end
end
