Canteen::Engine.routes.draw do
  root 'canteen/products#index'

  devise_for :users,
    class_name: 'Canteen::User',
    path:        '',
    path_prefix: nil,
    failure_app: 'Canteen::Devise::FailureApp',
    module:      :devise

  resources :products do
    resources :images
  end
end

Rails.application.routes.draw do
  
  root 'canteen/shop/products#home'

  resources :products, controller: 'canteen/shop/products', only: [:index, :show]

end
