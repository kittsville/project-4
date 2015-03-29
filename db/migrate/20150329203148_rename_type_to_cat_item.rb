class RenameTypeToCatItem < ActiveRecord::Migration
  def up
    rename_column :items, :type, :cat
  end
end
