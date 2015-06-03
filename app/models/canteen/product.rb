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

    field :bd, type: String,
      as:         :brand

    field :ct, type: String,
      as:         :category

    field :sct, type: String,
      as:         :sub_category

    field :rp, type: Float,
      as:         :retail_price

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

    field :dt, type: String,
      as:         :details
      
    # Properties

    field :sz, type: String,
      as:         :size

    # Flags
    field :sc, type: Boolean,
      as:         :showcase

    field :na, type: Boolean,
      as:         :new_arrival

    # Validations
    validates_presence_of   :sku, :name, :brand, :category, :sub_category, :retail_price, :cost_price, :description
    validates_uniqueness_of :sku

    #
    # Scope
    #
    scope :showcase, ->{ where(showcase: true) } 
    scope :new_arrivals, ->{ where(new_arrival: true) } 

    public 

    def to_s
      self.name
    end

    def discount?
      self.discount.nil? ? false : (self.discount > 0)
    end

    def showcase?
      self.showcase
    end

    def new_arrival?
      self.new_arrival
    end

    def sale_price
      return self.retail_price unless self.discount?
      return (self.retail_price * (1-(self.discount.to_f/100))).to_i
    end

    # Return feature image
    def image
      self.images.exists? ? self.images.first.file_url : ActionController::Base.new.view_context.image_path('noimagefound.png')
    end
  end
end
