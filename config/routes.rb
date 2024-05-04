Rails.application.routes.draw do

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    regstrations: "public/registrations",
    sessions: 'public/sesstions'
  }

  scope module: :public do
    get 'top' => "homes#top"
    get 'about' => "homes#about"
  end

end