module Canteen
  class Store::ProductsController < Store::BaseController

    before_action :load_resource, except: [
      :category,
      :create,
      :index,
      :new
    ]

    before_filter :load_resources, :only => [
      :category,
      :index
    ]

    # Must be called after load_recource filter.
    before_filter :check_resource_params, :only => [
      :create,
      :update
    ]

    def index
    end

    def category
      @categories = @products.distinct(:category)
      @brands = @products.distinct(:brand)
      @products = @products.where(category: params[:category]) if params.has_key?(:category)
      @products = @products.in(brand: params[:brand].keys.to_a) if params.has_key?(:brand)
    end

  end
end