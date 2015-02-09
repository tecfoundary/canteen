module Canteen
  class Shop::ProductsController < Shop::BaseController

    before_action :load_resource, except: [
      :create,
      :index,
      :new,
      :home
    ]

    before_filter :load_resources, :only => [
      :index,
      :home
    ]

    # Must be called after load_recource filter.
    before_filter :check_resource_params, :only => [
      :create,
      :update,
    ]

    def index
    end

    def home
    end
  end
end