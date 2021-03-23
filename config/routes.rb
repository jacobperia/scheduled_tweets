# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get "about-us", to:"about#index", as: :about
  root to:"main#index"
  # OR USE, get "/", to:"main#index"
end
