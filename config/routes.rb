Rails.application.routes.draw do
  # for devise user controller overwrite
  devise_for :users, controllers: { sessions: 'users/sessions'}
  
  root 'pages#home'

  # get all routes prebuilt for your custom model 
  resources :projects, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :bugs, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end
