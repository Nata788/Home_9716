Home9716::Application.routes.draw do
  root 'static_pages#home'
  match '/login', to: 'static_pages#login', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/profile', to: 'static_pages#profile', via: 'get'
match '/billing_and_payments', to: 'static_pages#billing_and_payments', via: 'get'
match '/settings', to: 'static_pages#settings', via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
