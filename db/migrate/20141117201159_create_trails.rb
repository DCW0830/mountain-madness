class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.decimal :distance
      t.text :description
      t.integer :rating
      t.string :location

      t.timestamps
    end
  end
end
