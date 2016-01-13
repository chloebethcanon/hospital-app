Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'pages#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get '/' => 'pages#index'
  get '/pages' => 'pages#index'

  get '/events' => 'events#index'
  get '/events/new' => 'events#new'
  post '/events' => 'events#create'
  get '/events/:id' => 'events#show'
  get '/events/:id/edit' => 'events#edit'
  patch '/events/:id' => 'events#update'
  delete '/events/:id' => 'events#destroy'

  post '/user_events' => 'user_events#create'
  get '/user_events/:id/edit' => 'user_events#edit'
  patch '/user_events/:id' => 'user_events#update'
  delete '/user_events/:id' => 'user_events#destroy'

  get '/services' => 'services#index'
  get '/services/new' => 'services#new'
  post '/services' => 'services#create'
  get '/services/:id' => 'services#show'
  get '/services/:id/edit' => 'services#edit'
  patch '/services/:id' => 'services#update'
  delete '/services/:id' => 'services#destroy'

  post '/user_services' => 'user_services#create'
  get '/user_services/:id/edit' => 'user_services#edit'
  patch '/user_services/:id' => 'user_services#update'
  delete '/user_services/:id' => 'user_services#destroy'

  get '/messages' => 'messages#index'
  get '/messages/new' => 'messages#new'
  post '/messages' => 'messages#create'
  get '/messages/:id' => 'messages#show'
  get '/messages/:id/edit' => 'messages#edit'
  patch '/messages/:id' => 'messages#update'
  delete '/messages/:id' => 'messages#destroy'


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
