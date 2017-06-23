Home9716::Application.routes.draw do
  root 'static_pages#home'
  match '/login', to: 'static_pages#login', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
