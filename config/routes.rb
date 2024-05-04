Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords] controllers: {
    regstrations: "public/registrations",
    sessions: 'public/sesstions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html




end
