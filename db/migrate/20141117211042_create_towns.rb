class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name, null: false
      t.string :zipcode, null: false

      t.timestamps
    end
  end
end
