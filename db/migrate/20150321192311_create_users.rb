class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :username
      t.string :password
      t.string :address

      t.timestamps null: false
    end
  end
end
