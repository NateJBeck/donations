class AddPickupIdToDonorsTable < ActiveRecord::Migration
  def change
    add_column :donors, :pickup_id, :integer, null: false
  end
end
