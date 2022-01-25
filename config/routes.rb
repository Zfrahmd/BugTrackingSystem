Rails.application.routes.draw do
  root 'pages#home'
  get 'projects/manage', to: 'projects#manage', as: 'manage_projects'
  get 'bugs/manage', to: 'bugs#manage', as: 'manage_bugs' 
  # for devise user controller overwrite
  devise_for :users, controllers: { sessions: 'users/sessions'}

  # get all routes prebuilt for your custom model
  resources :users, only: [:index, :show]
  resources :projects, only: [:show, :index, :new, :create, :edit, :update, :destroy]
  resources :bugs, only: [:show, :index, :new, :create, :edit, :update, :destroy]

end
