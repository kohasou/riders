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
  namespace :admin do
    root to: "homes#top"
    resources :users
  end

  scope module: :public do
    root to: "homes#top"
    get '/about' => 'homes#about', as: 'about'
    get '/users/my_page' => 'users#show', as: 'my_page'
    get '/users/information/edit' => 'users#edit', as: 'edit_customer'
    get '/users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
    patch '/users/information' => 'users#update', as: 'customer'
    patch '/users/deleteprocess' => 'users#deleteprocess', as: 'deleteprocess'
    resources :posts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
