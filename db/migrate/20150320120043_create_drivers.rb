class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :password
      t.boolean :available

      t.timestamps null: false
    end
  end
end
