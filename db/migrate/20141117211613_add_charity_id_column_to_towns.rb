class AddCharityIdColumnToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :charity_id, :integer
  end
end
