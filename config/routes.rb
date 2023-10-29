Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root :to => 'articles#index'
  resources :articles
  resources :comments
  resources :pictures

  resources :users do
    collection do
      get :show_login_page
      post :login
      delete :logout
      get :show_profile
      get :edit_profile
      post :save_profile
    end
  end

  resources :comment_users do
    collection do
      delete :logout
    end
  end

  namespace :api do
    resources :articles, only: [:index, :show]
  end
end
