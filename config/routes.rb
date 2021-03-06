Rails.application.routes.draw do
    
    root 'merchants#index'

    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'

    resources :merchants do
      resources :meals
      resources :orders
    end

    resources :orders do
      resources :line_items
    end

    resources :users

    get 'search' => 'merchants#search'

    post 'orders/:id/send_order' => 'orders#send_order', as: :send_order

    post 'orders/:id/accept_order' => 'orders#accept_order', as: :accept_order



# Merchants::Application.routes.draw do

  # get 'merchants' => 'merchants#index'
  # get 'merchants/new' => 'merchants#new'
  # get 'merchants/:id' => 'merchants#show', as: :merchant
  # get 'merchants/:id/edit' => 'merchants#edit', as: :edit_merchant
  # patch 'merchants/:id' => 'merchants#update'
  # post 'merchants' => 'merchants#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  end

