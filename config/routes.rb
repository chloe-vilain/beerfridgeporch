Rails.application.routes.draw do
  root 'beerchecks#new'
  post '/results', to: 'beerchecks#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
