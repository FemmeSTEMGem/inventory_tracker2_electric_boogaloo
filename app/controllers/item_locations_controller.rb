class ItemLocationsController < ApplicationController

  def create_inventory
    @item_names = Item.all.pluck(:name)
    @location_names = Location.all.pluck(:name)
  end

  def destroy_inventory
    @item_location = ItemLocation.find_by(
      item: Item.find_by(name: params[:item]),
      location: Location.find_by(name: params[:location])
    ) do |item_location|
      item_location.update(quantity: item_location.quantity -= params[:quantity])
    end

    if @item_location.save
      redirect_to root_path
    end
  end

  def move_inventory

  end

  def create_inventory_action
    @item_location = ItemLocation.new(
      item: Item.find_by(name: params[:item]),
      location: Location.find_by(name: params[:location]),
      quantity: params[:quantity]
    )

    if @item_location.save
      redirect_to root_path
    end
  end

  def destroy_inventory_action

  end

  def move_inventory_action

  end
end
