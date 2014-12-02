class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.integer  "image_file_size"
      t.datetime "image_updated_at"
      t.integer  "business_id"
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
end
