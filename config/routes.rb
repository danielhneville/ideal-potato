Rails.application.routes.draw do
  root :to => redirect('/main')
  resources 'sessions', only: [:create, :destroy]
  get '/main' => 'sessions#new'
  resources 'users', only: :create
  get '/dashboard/:id' => 'users#show'
  resources 'shoes', only: [:index, :create, :destroy]
  resources 'purchases', only: :create
end
