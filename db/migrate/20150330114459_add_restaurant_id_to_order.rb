class AddRestaurantIdToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.belongs_to :restaurant
      t.change :value, :float
      t.rename :value, :total
    end
    remove_column :delivery, :restaurant_id, :integer
  end
end
