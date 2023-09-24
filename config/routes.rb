Rails.application.routes.draw do
  root to: "homes#top"

  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    resources :whispers,      only:[:new, :create, :index, :show]
    resources :bookmarks,     only:[:create, :index, :destroy]
    resources :workouts,      only:[:new, :create, :edit, :update, :index, :show]
    resources :workout_lists, only:[:create, :index, :show, :destroy]
    resources :customers, only:[:show]
    # get '/customers/my_page'          => 'customers#show',    as: "customer"
    get '/customers/information/edit' => 'customers#edit',    as: "edit_customer"
    patch '/customers/information'    => 'customers#update',  as: "update_customer"
    get '/customers/unsubscribe', as: "unsubscribe_customer"
  end

  #管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
    resources :workouts,  only:[:show]
    resources :whispers,  only:[:index, :show]
    resources :customers, only:[:index, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
