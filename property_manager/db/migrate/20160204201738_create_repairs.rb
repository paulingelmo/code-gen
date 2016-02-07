class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :type
      t.string :cost

      t.timestamps null: false
    end
  end
end
