Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  resources :books do
    resources :comments
  end
  root to: "posts#index"
  resources :users_my, :controller => 'users'
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

