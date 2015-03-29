class ChangePriceIntToFloatItems < ActiveRecord::Migration
  def up
    change_column :items, :price, :float
  end
end
