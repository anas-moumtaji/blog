Rails.application.routes.draw do


  get 'sessions/new'
  get 'utilisateurs/nouveau'
  root 'pages#home'
  get 'contact' => 'pages#contact'
  get 'aide' => 'pages#aide'


 resources :utilisateurs

get 'login' => "sessions#new"
post 'login' => "sessions#create"
delete 'logout' => "sessions#destroy"


resources :articles,  only: [:create , :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
