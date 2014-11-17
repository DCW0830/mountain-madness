class CreateUsertrails < ActiveRecord::Migration
  def change
    create_table :usertrails do |t|
      t.integer :user_id
      t.integer :trail_id

      t.timestamps
    end
  end
end
