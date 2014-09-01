Rideshare::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"},
                    path_names: {sign_in: "login", sign_out: "logout"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  get 'switch_mode', to: 'users#switch_mode', as: :switch_mode
  get 'by_start', to: 'welcome#by_start', as: :by_start
  get 'by_start_json', to: 'welcome#by_start_json'
  post 'hop_on', to: 'users#hop_on'
  post 'update_seats', to: 'rides#update_seats'
  post 'accept', to: 'users#accept'
  post 'deny', to: 'users#deny'
  post 'jump_off', to: 'users#jump_off'
  post 'cancel', to: 'users#cancel'
  get 'rides/list_start', to: 'rides#list_start', as: :list_start
  get 'rides/new', to: 'rides#new', as: :new_ride
  post 'create_ride', to: 'rides#create', as: :create_ride
  post 'users/drive', to: 'users#drive', as: :driver
  #
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  get 'user/:id' => 'users#index', as: :user
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
