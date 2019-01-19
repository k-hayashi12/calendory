Rails.application.routes.draw do
  root 'root#top'

  devise_for :users

  resources :users, only:[:show, :edit, :update]
  resources :events do
     resources :comments, only:[:new, :show, :create, :edit, :update, :destroy]
     resources :photos, only:[:new, :create, :index, :destroy]
   end
  resources :photos, only:[:new, :create, :index, :destroy]
  resources :comments, only:[:new, :show, :create, :edit, :update, :destroy]
  resources :groups, only:[:new, :show, :create, :edit, :update, :destroy] do
    resources :group_events, only:[:new, :create]
    resources :group_users, only:[:new, :create, :index, :destroy]
  end
  resources :group_events, only:[:show, :edit, :update, :destroy] do
    resources :group_photos, only:[:new, :create, :index, :destroy]
    resources :group_comments, only:[:new, :show, :create, :edit, :update, :destroy]
  end
  resources :group_photos, only:[:new, :create, :index, :destroy]
  resources :group_comments, only:[:new, :show, :create, :edit, :update, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
