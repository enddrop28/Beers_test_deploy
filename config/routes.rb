Rails.application.routes.draw do
  
  # 会員側のdeviseルーディング設定
  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }
  # 顧客側のdeviseルーディング設定
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: "user/sessions"
  }
  
  root 'homes#top'
  get 'about' => 'homes#about', as: 'about'
  
  # 管理者側のルーティング設定
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :categories, only: [:index, :create, :edit, :update]
  end
  
  scope module: :user do
    get 'users/ranking' => 'users#ranking', as: 'ranking'
    resources :users, only: [:show, :edit, :update]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
