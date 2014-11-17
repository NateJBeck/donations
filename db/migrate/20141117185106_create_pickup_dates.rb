class CreatePickupDates < ActiveRecord::Migration
  def change
    create_table :pickup_dates do |t|
      t.date :date, null: false

      t.timestamps
    end
  end
end
