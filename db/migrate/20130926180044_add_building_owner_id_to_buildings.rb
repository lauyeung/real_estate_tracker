class AddBuildingOwnerIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :building_owner_id, :integer
  end
end
