Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  root to: "public/homes#top"

  scope module: :public do
    get 'about' => "homes#about"
    get 'mypage' => 'users#mypage', as: "mypage"
    get 'mypage/edit' => 'users#edit', as: "mypage_edit"
    patch 'mypage' => 'users#update'
    get 'unsubscribe' => 'users#unsubscribe', as: "unsubscribe"
    patch 'withdrow' => 'users#withdrow', as: "withdrow"

    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end

    resources :balloons, only: [:new, :create, :show, :update, :destroy] do
      resource :balloon_stickers, onlu: [:create]
    end
    get 'searches/search'
    post "searches/user_search"
  end

  namespace :admin do
    get 'homes/top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :balloons, only: [:index, :show, :destroy]
  end

end