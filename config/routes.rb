Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "onboarding", to: 'pages#onboarding'
  get "update_user_after_onboarding", to: 'users#update_user_after_onboarding'

  resources :users, only: [:show] do
    resources :reviews, only: [:create, :new, :update, :destroy, :edit]
  end

resources :exams, only: [:create] do
  member do
    get 'desktop_onboading' => 'exams#desktop_onboarding', as: 'desktop_onboarding'
    get 'desktop_questions' => 'exams#desktop_questions', as: 'desktop_questions'
    get 'desktop_results' => 'exams#desktop_results', as: 'desktop_results'
    get 'mobile_onboarding' => 'exams#mobile_onboarding', as: 'mobile_onboarding'
    get 'mobile_questions' => 'exams#mobile_questions', as: 'mobile_questions'
    get 'mobile_results' => 'exams#mobile_results', as: 'mobile_results'
    resource :user_answers, only: [:create]
  end
end

end

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
