Rails.application.routes.draw do
  # Routes for the Goal resource:
  # CREATE
  get "/goals/new", :controller => "goals", :action => "new"
  post "/create_goal", :controller => "goals", :action => "create"

  # READ
  get "/goals", :controller => "goals", :action => "index"
  get "/goals/:id", :controller => "goals", :action => "show"

  # UPDATE
  get "/goals/:id/edit", :controller => "goals", :action => "edit"
  post "/update_goal/:id", :controller => "goals", :action => "update"

  # DELETE
  get "/delete_goal/:id", :controller => "goals", :action => "destroy"
  #------------------------------

  # Routes for the Personal_board resource:
  # CREATE
  get "/personal_boards/new", :controller => "personal_boards", :action => "new"
  post "/create_personal_board", :controller => "personal_boards", :action => "create"

  # READ
  get "/personal_boards", :controller => "personal_boards", :action => "index"
  get "/personal_boards/:id", :controller => "personal_boards", :action => "show"

  # UPDATE
  get "/personal_boards/:id/edit", :controller => "personal_boards", :action => "edit"
  post "/update_personal_board/:id", :controller => "personal_boards", :action => "update"

  # DELETE
  get "/delete_personal_board/:id", :controller => "personal_boards", :action => "destroy"
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get "/users/new", :controller => "users", :action => "new"
  post "/create_user", :controller => "users", :action => "create"

  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"

  # UPDATE
  get "/users/:id/edit", :controller => "users", :action => "edit"
  post "/update_user/:id", :controller => "users", :action => "update"

  # DELETE
  get "/delete_user/:id", :controller => "users", :action => "destroy"
  #------------------------------

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
