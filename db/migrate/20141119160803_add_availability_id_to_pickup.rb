class AddAvailabilityIdToPickup < ActiveRecord::Migration
  def change
    add_column :pickups, :availability_id, :integer, null: false
  end
end
