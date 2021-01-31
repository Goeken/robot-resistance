Rails.application.routes.draw do
  root to: 'static_pages#home'

  resources :heroes, only: [:index, :create, :new]
  get '/search' => 'heroes#search'
end
