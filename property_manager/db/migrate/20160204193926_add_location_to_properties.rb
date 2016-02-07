class AddLocationToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :location, :string
    add_column :properties, :rent, :string
  end
end
