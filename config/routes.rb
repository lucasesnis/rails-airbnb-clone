Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, expect: [:index]
  resources :services, only: [:index, :show] do
    resources :offers do
      resources :transactions
    end
  end

end
