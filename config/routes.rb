Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/show'
  get 'transactions/new'
  get 'transactions/create'
  get 'transactions/edit'
  get 'transactions/update'
  devise_for :users
  root to: 'services#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show]
  resources :services, only: [:index, :show]
  resources :offers do
    resources :transactions, except: [:destroy]
  end

end
