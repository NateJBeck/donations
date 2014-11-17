class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :charity_id, null: false
      t.integer :town_id, null: false
      t.date :date, null: false

      t.timestamps
    end

    add_index :availabilities, [:charity_id, :town_id], unique: true
  end
end
