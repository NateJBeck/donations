class RemoveIndexFromPickupsTable < ActiveRecord::Migration
  def change
    remove_index(
      :pickups,
      name: "index_pickups_on_town_id"
    )
  end
end
