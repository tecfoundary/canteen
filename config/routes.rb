Canteen::Engine.routes.draw do
  root 'canteen/products#index'

  devise_for :users,
    class_name: 'Canteen::User',
    path:        '',
    path_prefix: nil,
    failure_app: 'Canteen::Devise::FailureApp',
    module:      :devise

  resources :products do
    member do
      post :image
    end
    # resources :images
  end

  resource :dashboard

  scope module: 'store' do
    resources :products, as: 'store', path: '/' do
      collection do
        get 'category'
      end
    end

  end
end
