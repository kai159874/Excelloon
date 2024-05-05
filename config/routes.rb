Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    regstrations: "public/registrations",
    sessions: 'public/sesstions'
  }

  root to: "public/homes#top"

  scope module: :public do
    get 'about' => "homes#about"
    get 'mypage' => 'users#mypage', as: "mypage"
    
    resources :users, only: [:edit, :show, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    
    resources :balloons, only: [:new, :create, :edit, :show, :update, :destroy]
    
    get 'searches/search'
  end

  namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :balloons, only: [:index, :show, :edit, :destroy]
  end

end