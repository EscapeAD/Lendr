Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resource :user, only: [:show]

  resources :items do
    resources :checkouts
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
