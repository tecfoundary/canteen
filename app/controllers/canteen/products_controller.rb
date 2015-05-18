module Canteen
  class ProductsController < Canteen::BaseController

    before_action :load_resource, except: [
      :create,
      :index,
      :new
    ]

    before_filter :load_resources, :only => [
      :index,
    ]

    # Must be called after load_recource filter.
    before_filter :check_resource_params, :only => [
      :create,
      :update
    ]

    def create
      logger.debug "Creating Product with #{params}"
      @product = Canteen::Product.new product_params.except(:images)
      @product.save!

      # Save images if uploaded
      product_params[:images].each { |i| @product.images.create! file: i } if product_params.has_key?(:images)
      
      respond_to do |format|
        notify :notice, ::I18n.t('messages.resource.created',
          :type       => Canteen::Product.model_name.human,
          :resource   => @product
        )
        format.html { redirect_to action: :show, id: @product }
      end
    rescue Mongoid::Errors::Validations => e
      respond_to do |format|
        notify_now :error, ::I18n.t('messages.resource.not_valid',
          :type     => Canteen::Product.model_name.human,
          :errors   => @product.errors.full_messages.to_sentence
        )
        format.html { render :action => :new, :status => 422 }
      end
    end

    def edit
    end

    def index
    end

    def image
      img = @product.images.find(params[:remove_image])
      img.delete
      head :ok, content_type: "text/html"
    end
    
    def new
    end

    def update
      @product.update_attributes product_params.except(:images)
      @product.save!

      product_params[:images].each { |i| @product.images.create! file: i } if product_params.has_key?(:images)
      # @product.images.create! file: params[:product][:images]
          
      respond_to do |format|
        format.html { 
          notify :notice, ::I18n.t('messages.resource.updated',
            :type       => Product.model_name.human,
            :resource   => @product
          )
          redirect_to action: :show, id: @product 
        }
        format.js { # For file drag and drop
          @image = @product.images.last
        }
      end
    rescue Mongoid::Errors::Validations => e
      respond_to do |format|
        notify_now :error, ::I18n.t('messages.resource.not_valid',
          :type     => Product.model_name.human,
          :errors   => @product.errors.full_messages.to_sentence
        )
        format.html { render :action => :new, :status => 422 }
      end
    end

    private

    def product_params
      params.require(:product).permit(:name, :sku, :cost_price, :retail_price, :discount, :description, :type, :size,:material, :destroy_image, :images => [])
    end
  
  end
end