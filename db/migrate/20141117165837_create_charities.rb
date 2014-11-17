class CreateCharities < ActiveRecord::Migration
  def change
    create_table :charities do |t|
      t.string :name, null: false, uniqueness: true
      t.text :info, null: false
      t.string :logo_url, null: false

      t.timestamp null: false
    end
  end
end
