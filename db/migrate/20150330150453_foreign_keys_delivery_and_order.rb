class ForeignKeysDeliveryAndOrder < ActiveRecord::Migration
  def change
    add_foreign_key :delivery, :orders
    add_foreign_key :delivery, :drivers
    add_foreign_key :orders, :restaurants
  end
end
