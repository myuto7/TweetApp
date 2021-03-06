Rails.application.routes.draw do
  #get 'users/index'
  #get 'user/index'
  get "/" => "home#top"
  get "about" => "home#about"

  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "users" => "users#index"
  get "users/:id" => "users#show"
  get "signup" => "users#signup"
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "users/:id/likes" => "users#likes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end