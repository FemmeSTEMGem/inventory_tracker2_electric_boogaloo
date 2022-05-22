class ItemLocation < ApplicationRecord
  class InsufficientInventoryError < StandardError; end
  class LogicError < StandardError; end

  # == Constants ============================================================

  # == Properties ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  belongs_to :item
  belongs_to :location

  # == Validations ==========================================================

  validates :quantity, numericality: { only_integer: true, message: "Please ensure quantity is a whole number." }
  validates :quantity, numericality: { greater_than: -1, message: "Please ensure quantity is not a negative number." }

  # == Callbacks ============================================================

  # == Scopes ===============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  def move(item:, quantity:, from:, to:)
    if quantity < 1
      raise LogicError, message: "Please enter a positive number for quantity."
    end


    from_item_location = ItemLocation.find_or_create_by!(
      item: item,
      location: from
    )

    to_item_location = ItemLocation.find_or_create_by!(
      item: item,
      location: to
    )


    if from_item_location.quantity < quantity
      raise InsufficientInventoryError, message: "Insufficient inventory."
    end

    ItemLocation.transaction do
      from_item_location.quantity -= quantity
      from_item_location.save!

      to_item_location.quantity += quantity
      to_item_location.save!
    end
  end
end
