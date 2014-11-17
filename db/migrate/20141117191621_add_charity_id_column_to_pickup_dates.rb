class AddCharityIdColumnToPickupDates < ActiveRecord::Migration
  def change
    add_column :pickup_dates, :charity_id, :integer
  end
end
