class RemoveDuplicatePriceFromItem < ActiveRecord::Migration
  def up
    remove_column :items, :cost
  end
end
