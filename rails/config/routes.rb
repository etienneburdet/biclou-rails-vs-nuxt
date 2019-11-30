Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bikes, only: %i[ index destroy update create] do
    resources :rentals, only: %i[ new create ]
  end
  resources :rentals, only: %i[index]
  get 'search', to: "bikes#search", as: :search
end
