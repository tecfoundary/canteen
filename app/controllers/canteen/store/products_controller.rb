module Canteen
  class Store::ProductsController < Store::BaseController

    before_action :load_resource, except: [
      :create,
      :index,
      :new
    ]

    before_filter :load_resources, :only => [
      :index
    ]

    # Must be called after load_recource filter.
    before_filter :check_resource_params, :only => [
      :create,
      :update
    ]

    def index
    end

  end
end