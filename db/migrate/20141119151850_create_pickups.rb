class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.string :address, null: false
      t.integer :town_id, null: false
      t.string :telephone, null: false
      t.boolean :confirmed, null: false, default: false
      t.string :email, null: false

      t.timestamps null: false
    end

    add_index :pickups, :town_id, unique: true
  end
end
