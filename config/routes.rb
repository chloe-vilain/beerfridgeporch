Rails.application.routes.draw do
  root 'requests#new'
  resources :requests
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
