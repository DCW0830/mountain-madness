class AddTrailIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :trail_id, :integer
  end
end
