class ChangeDriverAvailbleToInteger < ActiveRecord::Migration
  def change
    remove_column :drivers, :available, :boolean
    add_column :drivers, :available, :integer
  end
end
