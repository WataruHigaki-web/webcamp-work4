Rails.application.routes.draw do
  root 'users#top'
  get  '/home/about', to: 'users#about', as: 'about'
  devise_for :users
  resources :books
  resources :users , only: [:index, :edit, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
