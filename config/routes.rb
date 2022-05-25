Rails.application.routes.draw do
  root "locations#index"

  resources :locations
  resources :items
  resources :item_locations, only: [ :edit, :update ]

  get 'create_inventory', to: 'item_locations#create_inventory'
  post 'create_inventory_action', to: 'item_locations#create_inventory_action'

  get 'destroy_inventory', to: 'item_locations#destroy_inventory'
  post 'destroy_inventory_action', to: 'item_locations#destroy_inventory_action'
  
  get 'move_inventory', to: 'item_locations#move_inventory'
  post 'move_inventory_action', to: 'item_locations#move_inventory_action'
end
