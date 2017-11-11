Rails.application.routes.draw do
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
  
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
    get '/users/next_steps' => 'users/registrations#next_steps'
    post '/users/add_skill' => 'users/registrations#add_skill', :defaults => { :format => :json }
    post '/users/add_cause' => 'users/registrations#add_cause', :defaults => { :format => :json }
  end
  
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  resources :users, only: [:index, :show]
  
  get 'how_it_works/' => 'application#how_it_works'
  get 'our_impact' => 'application#our_impact'
  
  root 'application#index'
  
end
