Rails.application.routes.draw do
  resources :customers, only: [ :index ]
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
