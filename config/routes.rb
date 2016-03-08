Rails.application.routes.draw do
  # namespace :api, defaults: { format: :json } do
  #   namespace :v1 do
  #   end
  # end

  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
