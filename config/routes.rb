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
  end

  scope module: :public do
    root to: "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
