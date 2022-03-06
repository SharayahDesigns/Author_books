Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # prepends routes with api

namespace :api do
 #get from client (url)    ---     tell you where to go in rails app
 #httpv  path                      controller#method
  get 'authors',               to: "authors#index"
  get '/authors/:id',          to: "authors#show"
  post '/authors',             to: "authors#create"
  put '/authors/:id',          to: "authors#update"
  delete 'authors/:id',        to: "authors#destroy"

  
end
end
