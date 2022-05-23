Rails.application.routes.draw do
  root "locations#index"

  resources :locations
  resources :items
  resources :item_locations, only: [ :edit, :update ]
end
