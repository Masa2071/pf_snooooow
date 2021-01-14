Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:show, :update, :new, :create, :edit] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  put "/users/:id/hide" => "users#hide", as: 'users_hide'
  resources :posts do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :rooms, only: [:create, :show, :index]
  resources :chats, only: [:create]
  resources :events do
    resource :event_users, only: [:create, :destroy]
    resources :event_comments, only: [:create, :destroy]
  end
end
