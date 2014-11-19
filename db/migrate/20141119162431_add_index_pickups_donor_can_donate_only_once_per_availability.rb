class AddIndexPickupsDonorCanDonateOnlyOncePerAvailability < ActiveRecord::Migration
  def change
    add_index :pickups, [:email, :availability_id], unique: true
  end
end
