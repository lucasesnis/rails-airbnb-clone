Rails.application.routes.draw do
  devise_for :users
  root to: 'services#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :services, only: [:index, :show]
  resources :transactions, only: [:index]
  resources :offers do
    resources :transactions, except: [:destroy, :index]
  end

end
