Rails.application.routes.draw do
  get 'session/new'

  get 'static/index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'
  get 'signup' => 'users#new'
  get 'login'  => 'session#new'
  post 'login'  => 'session#create'
  delete 'logout' => 'session#destroy'
  get "myrooms" => 'room#index'
  get "new_reservation" => 'reservation#new'
  post "new_reservation" => 'reservation#create'
  get "get_rooms_for_category" => 'room#get_rooms'
end
