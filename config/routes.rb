Rails.application.routes.draw do
  get 'stocks/search'
  get 'my_portfolio', to:'customers#my_portfolio'
  get 'search_stock', to: 'stocks#search'
  resources :customers, only: [ :index ]
  devise_for :customers, controllers: {
    registrations: 'customers/registrations'
  }
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
