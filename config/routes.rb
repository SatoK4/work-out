Rails.application.routes.draw do
  root to: "homes#top"

  #顧客用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  scope module: :public do
    resources :whispers,            only:[:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :whisper_comments,  only:[:create, :destroy, :update]
      resources :whisper_bookmarks, only:[:create, :destroy]
    end

    resources :workouts,            only:[:new, :create, :index, :edit, :update, :show, :destroy] do
      resources :workout_comments,  only:[:create, :destroy]
      resources :workout_bookmarks, only:[:create, :destroy]
    end

    resources :workout_lists,       only:[:create, :index, :show, :destroy]
    get '/customers/:id/whispers'           => 'customers#whisper',           as: "whispers_customer"
    get '/customers/:id/whisper_bookmarks'  => 'customers#whisper_bookmark',  as: "whisper_bookmarks_customer"
    get '/customers/:id/workouts'           => 'customers#workout',           as: "workouts_customer"
    get '/custoemrs/:id/workout_bookmarks'  => 'customers#workout_bookmark',  as: "workout_bookmarks_customer"
    get '/customers/information/edit'       => 'customers#edit',              as: "edit_customer"
    patch '/customers/information'          => 'customers#update',            as: "update_customer"
    get '/customers/unsubscribe',                                             as: "unsubscribe_customer"
    patch '/customers/withdrawal',                                            as: "withdrawal_customer"
    get 'search'                            => 'workouts#search'
  end

  #管理者用
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
    resources :workouts,  only:[:show, :destroy] do
      resources :workout_comments, only:[:destroy]
    end
    resources :whispers,  only:[:index, :show, :destroy] do
      resources :whisper_comments, only:[:destroy]
    end
    resources :customers, only:[:index, :show]
    resources :tags,      only:[:index, :create, :destroy]
    get '/:id/whispers'     => 'customers#whisper',     as: "customer_whispers"
    get '/:id/workouts'     => 'customers#workout',     as: "customer_workouts"
    patch 'withdrawal/:id'  => 'customers#withdrawal',  as: "customer_withdrawal"
  end
end
