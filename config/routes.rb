Rails.application.routes.draw do
  root 'homes#index'
  get '/about', to: 'homes#index', as: 'about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schools, only: [:index]
  resources :projects, only: [:index]
  resources :writings, only: [:index, :show]
end
