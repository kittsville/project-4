class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :value
      t.boolean :complete
      t.date :date

      t.timestamps null: false
    end
  end
end
