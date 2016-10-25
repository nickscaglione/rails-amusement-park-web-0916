Rails.application.routes.draw do

  resources :users, :attractions

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  get '/', to: 'sessions#index'
  post '/attractions/:id/add_user', to: 'attractions#add_user'

end
