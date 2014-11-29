class AddTrailIdToImages < ActiveRecord::Migration
  def change
    add_column :images, :trail_id, :integer
  end
end
