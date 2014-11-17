class RemoveIndexAvailabilitiesTable < ActiveRecord::Migration
  def change
    remove_index(
      :availabilities,
      :name => "index_availabilities_on_charity_id_and_town_id"
    )
    add_index :availabilities, [:charity_id, :town_id]
    add_index :availabilities, [
      :charity_id,
      :town_id,
      :date
    ], unique: true
  end
end
