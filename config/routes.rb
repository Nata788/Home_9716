Home9716::Application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/profile', to: 'users#show', via: 'get'
  match '/billing_and_payments', to: 'static_pages#billing_and_payments', via: 'get'
  match '/settings', to: 'static_pages#settings', via: 'get'
  get '/new', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
