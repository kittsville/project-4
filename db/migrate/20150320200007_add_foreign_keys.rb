class AddForeignKeys < ActiveRecord::Migration
  def change
    create_table :delivery do |t|
      t.belongs_to :order
      t.belongs_to :restaurant
      t.belongs_to :driver
    end
    
    change_table :orders do |t|
      t.string :address
    end
    
  end
end
