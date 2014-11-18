class CreatePresences < ActiveRecord::Migration
  def change
    create_table :presences do |t|
      t.integer :charity_id, null: false
      t.integer :town_id, null: false

      t.timestamps
    end

    add_index :presences, [:charity_id, :town_id], unique: true
  end
end
