class AddTrailColumnsToTrails < ActiveRecord::Migration
  def change
    add_column :trails, :name, :string
    add_column :trails, :city, :string
    add_column :trails, :state, :string
    add_column :trails, :directions, :text
    add_column :trails, :lat, :string
    add_column :trails, :lon, :string
    add_column :trails, :url, :string
    add_column :trails, :thumbnail, :string
  end
end
