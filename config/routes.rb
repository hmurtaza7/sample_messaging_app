Rails.application.routes.draw do

  get 'ads/index'
  get 'ads/show'

  resources :messages

  resources :ads do
    resource  :user
    resources :messages do
      resource :reply
    end
  end

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'application#home'
end
