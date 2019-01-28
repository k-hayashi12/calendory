Rails.application.routes.draw do

  root 'root#top'
  get 'user_serch' => 'groups#index', as: 'users'
  get '/users/:id/group_show' => 'users#group_show', as: 'group_show'

  post "/users/:id/group_show" => "group_users#create", as: "group_users_create"

  delete '/groups/:id/user_destroy' => 'group_users#destroy', as: 'group_users_destroy'
  delete '/events/:id/photos' => 'photos#destroy', as: 'photo_destroy'
  delete '/group_events/:id/group_photos' => 'group_photos#destroy', as: 'group_photo_destroy'
  delete '/users/:id/edit' => 'users#destroy', as:"user_destroy"
  devise_for :users

  resources :users, only:[:show, :edit, :update]
  post 'users' => 'users#create', as: "groupe_users"
  resources :events do
     resources :comments, only:[:new, :show, :create, :edit, :update, :destroy]
     resources :photos, only:[:new, :create, :index, :destroy]
   end
  resources :photos, only:[:new, :create, :index, :destroy]
  resources :comments, only:[:new, :show, :create, :edit, :update, :destroy]
  resources :groups, only:[:new, :show, :create, :edit, :update , :destroy] do
    resources :group_events, only:[:new, :create]
    resources :group_users, only:[:new, :index, :destroy]
  end
  resources :group_events, only:[:show, :edit, :update, :destroy] do
    resources :group_photos, only:[:new, :create, :index, :destroy]
    resources :group_comments, only:[:new, :show, :create, :edit, :update, :destroy]
  end
  resources :group_photos, only:[:new, :create, :index, :destroy]
  resources :group_comments, only:[:new, :show, :create, :edit, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
