Rails.application.routes.draw do

  get 'profiles/account' => 'profiles#account'

  devise_for :users
  get 'tags/:tag' => 'articles#index', as: :tag

  get 'info' => 'helps#info'

  root 'helps#info'

  resources :articles
    resources :comments
  get 'index'=>'articles#index'
  get 'show'=>'articles#show'
  get 'new'=>'articles#new'
  post 'new'=>'articles#create'
  post 'articles/:id' => "articles#show"
  get 'edit'=>'articles#edit'
  patch 'articles/:id' => 'articles#update'
  get 'delete' => 'articles#delete'
  post 'delete' => 'articles#destroy'
  get 'listindex' => 'articles#listindex'
  get 'indexall' => 'articles#indexall'

  get 'by_timing' => 'timinggs#by_timing'
  get 'daily' => 'timinggs#daily'
  get 'weekly' => 'timinggs#weekly'
  get 'biweekly' => 'timinggs#biweekly'
  get 'monthly' => 'timinggs#monthly'
  get 'quarterly' => 'timinggs#quarterly'
  get 'annually' => 'timinggs#annually'
  get 'onrequest' => 'timinggs#onrequest'
  get 'adhoc' => 'timinggs#adhoc'

  resources :categories
    resources :comments
  get 'index'=>'categories#index'
  get 'show'=>'categories#show'
  get 'new'=>'categories#new'
  post 'new'=>'categories#create'
  post 'categories/:id' => 'categories#show'
  get 'edit'=>'categories#edit'
  patch 'categories/:id' => 'categories#update'
  get 'categories/delete/:id' => 'categories#delete'
  post 'categories/delete/:id' => 'categories#destroy'

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
