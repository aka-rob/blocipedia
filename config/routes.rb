Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/registrations/downgrade' => 'users/registrations#downgrade'
  end
  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
