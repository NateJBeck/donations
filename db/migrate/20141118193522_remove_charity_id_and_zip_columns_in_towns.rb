class RemoveCharityIdAndZipColumnsInTowns < ActiveRecord::Migration
  def change
    remove_column :towns, :zipcode
    remove_column :towns, :charity_id
  end
end
