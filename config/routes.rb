Rails.application.routes.draw do

  #ユーザー用
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  #管理者
  namespace :admin do
    root to: "homes#top"
    get '/users' => 'users#index', as: 'users'
    get '/users/:id' => 'users#show', as: 'user_show'
    get '/users/:id/edit' => 'users#edit', as: 'user_edit'
    get '/users/:id/profile' => 'users#profile', as: 'user_profile'
    post '/users/:id' => 'users#update', as: 'update'
    resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :nices, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end

  #ユーザー
  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get '/users/:id' => 'users#show', as: 'user'
    get '/users/information/edit' => 'users#edit', as: 'edit_customer'
    get '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    get '/users/:id/nice' => 'users#nices', as: 'nice'
    get "search" => "searches#search"
    patch '/users/information' => 'users#update', as: 'customer'
    patch '/users/deleteprocess' => 'users#deleteprocess', as: 'deleteprocess'
    resources :notifications, only: :index
    resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
      resource :nices, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
