module Canteen
  class ImagesController < BaseController
    CREATE_UPDATE_ATTRIBUTES = [
      :file
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
      @image = Canteen::Product.find(params[:product_id]).images.create! params[:image]
    end

    private

    def image_params
      params.require(:image).permit(*PERMITTED_PARAMS)
    end
  end
end
