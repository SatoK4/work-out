Rails.application.routes.draw do
  namespace :admin do
    
  end
  root to: "homes#top"

  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    resources :whispers,          only:[:new, :create, :index, :show, :destroy]
    resources :whisper_bookmarks, only:[:create, :index, :destroy]
    resources :workouts,          only:[:new, :create, :index, :show, :destroy]
    resources :workout_bookmarks, only:[:create, :index, :destroy]
    resources :workout_lists,     only:[:create, :index, :show, :destroy]
    get '/customers/:id/whispers'     => 'customers#whisper', as: "whispers_customer"
    get '/customers/:id/workouts'     => 'customers#workout', as: "workouts_customer"
    get '/customers/information/edit' => 'customers#edit',    as: "edit_customer"
    patch '/customers/information'    => 'customers#update',  as: "update_customer"
    get '/customers/unsubscribe',                             as: "unsubscribe_customer"
    patch '/customers/withdrawal',                            as: "withdrawal_customer"
    get 'search'                      => 'workouts#search'
  end

  #管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
    resources :workouts,  only:[:show, :destroy]
    resources :whispers,  only:[:index, :show, :destroy]
    resources :customers, only:[:index, :show, :destroy]
    resources :tags,      only:[:index, :create, :destroy]
    get '/:id/whispers' => 'customers#whisper', as: "customer_whispers"
    get '/:id/workouts' => 'customers#workout', as: "customer_workouts"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
