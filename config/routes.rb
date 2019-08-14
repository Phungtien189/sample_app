Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :companies,          only: [:create, :destroy, :index, :show, :update, :new, :edit]
  resources :products
  resources :invoices
  resources :invoice_details
end
