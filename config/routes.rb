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
    get   'about'                   => "homes#about"
    get   'tos'                     => "homes#tos"
    get   'mypage'                  => 'users#mypage', as: "mypage"
    get   'mypage/edit'             => 'users#edit', as: "mypage_edit"
    patch 'mypage'                  => 'users#update'
    get   'unsubscribe'             => 'users#unsubscribe', as: "unsubscribe"
    patch 'withdrow'                => 'users#withdrow', as: "withdrow"
    get   "mypage/friends"          => "relationships#friends", as: "friends"
    get   "mypage/follow_requests"  => "relationships#follow_requests", as: "follow_requests"
    resources :users, only: [:show] do
      resource :relationships, only: [:create, :destroy]
    end
    resources :chats, only: [:show, :create]

    resources :balloons,            only: [:new, :create, :show, :update, :destroy] do
      resource  :favorites,         only: [:create, :destroy]
      resource  :balloon_stickers,  only: [:create]
      resources :balloon_comments,  only: [:create, :destroy]
      resource  :reports,           only: [:create]
    end
    get 'searches/search'
    get 'searches/balloons_search'
    post "searches/user_search"
  end

  namespace :admin do
    get 'top' => "homes#top"
    resources :users,     only: [:index, :show, :update]
    resources :balloons,  only: [:show, :destroy] do
      resources :balloon_comments, only: [:destroy]
    end
    resources :stickers,  only: [:index, :edit, :create, :update, :destroy]
  end

end