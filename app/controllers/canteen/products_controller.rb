module Canteen
  class ProductsController < Canteen::BaseController
    CREATE_UPDATE_ATTRIBUTES = [
    :name,
    :sku,
    :cost_price,
    :sell_price,
    :discount,
    :description,
    :type,
    :size,
    :material
    ]

    PERMITTED_PARAMS = [
      CREATE_UPDATE_ATTRIBUTES,
    ]

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
      :update,
    ]

    def create
      logger.debug "Creating Product with #{params}"
      @product = Canteen::Product.new(params[:product].slice(*CREATE_UPDATE_ATTRIBUTES))
      
      @product.save!

      # Save images if uploaded
      # params[:product][:images].each { |i| @product.images.create! file: i }
      
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

    def new
    end

    def update
      logger.debug "Updating Product with #{params}"
      @product.update_attributes(params[:product].slice(*CREATE_UPDATE_ATTRIBUTES))

      @product.save!

      # Save images if uploaded
      # params[:product][:images].each { |i| @product.images.create! file: i } if params[:product].has_key?(:images)

      # Remove images if requested 
      # unless params[:product][:images_remove].nil?
      #   params[:product][:images_remove].each do |k,v| 
      #     if v.eql?("1")
      #       @product.images.find(k).file.remove! 
      #       @product.images.find(k).delete
      #     end
      #   end 
      # end
          
      respond_to do |format|
        notify :notice, ::I18n.t('messages.resource.created',
          :type       => Product.model_name.human,
          :resource   => @product
        )
        format.html { redirect_to action: :show, id: @product }
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
      params.require(:product).permit(*PERMITTED_PARAMS)
      # params.require(:product).permit(*PERMITTED_PARAMS).tap do |whitelisted|

      #   # grrrr.....Nested attributes need to overriden in this fashion
      #   whitelisted[:images] = params[:product][:images]
      #   whitelisted[:images_remove] = params[:product][:images_remove]
      # end
    end
  
  end
end