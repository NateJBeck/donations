class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :email, null: false

      t.timestamps null: false
    end
  end
end
