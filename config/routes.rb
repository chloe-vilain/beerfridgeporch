Rails.application.routes.draw do
  get '/info', to: 'static_pages#info'
  get '/help', to:'static_pages#help'
  root 'beerchecks#new'
  post '/results', to: 'beerchecks#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
