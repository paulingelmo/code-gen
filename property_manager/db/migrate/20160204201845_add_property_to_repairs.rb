class AddPropertyToRepairs < ActiveRecord::Migration
  def change
    add_reference :repairs, :property, index: true, foreign_key: true
  end
end
