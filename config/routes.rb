Mcp::Application.routes.draw do

  match 'logout' => 'sessions#destroy'

  match 'login' => 'sessions#new'

  match '/sessions/create' => 'session#create'

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :alerts

  get "jobs/show"

  get "jobs/scranton"

  get "api/destroy"

  get "api/hostping"

  get "api/serviceping"

  get "api/winjobs"
  post "api/collectd"

  get "dashboard/index"

  get "dashboard/show"

  get "dashboard/new"

  get "dashboard/edit"

  get "dashboard/destroy"

  get "dashboard/report"

  get "dashboard/generate"

  get "dashboard/nagios"

  get "dashboard/update"

  resources :alarms

  match 'notifications/alert_check' => 'alerts#alert_check'
  match 'notifications/ignored/:alert/:id' => 'alerts#ignored'
  match 'notifications/blocked/:alert/:id' => 'alerts#blocked'
  match 'notifications/acknowledged/:alert/:id' => 'alerts#acknowledged'

  resources :users
  
  match 'users/:id/destroy' => 'users#destroy'
  
  root :to => 'users#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
