class ChangeLocationToCity < ActiveRecord::Migration
  def change
    rename_column :properties, :location, :city
  end
end
