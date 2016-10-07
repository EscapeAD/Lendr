Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'welcome#index'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resource :user, only: [:show]

  resources :items do
    resources :stories, only: [:update]
    resources :checkouts do
      resources :verifications
    end
  end

  resources :items do
    resources :pictures, only: [:destroy]
  end

  resources :mailboxes
  resources :messages, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
