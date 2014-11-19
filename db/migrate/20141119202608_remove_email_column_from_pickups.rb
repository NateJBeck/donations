class RemoveEmailColumnFromPickups < ActiveRecord::Migration
  def change
    remove_column :pickups, :email
  end
end
