class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :image_id, index: true
      t.string :filename
      t.string :width
      t.string :height
      t.string :small_link
      t.string :medium_link
      t.string :large_link
      t.references :camera_model, foreign_key: true, index: true
      t.references :camera_make, foreign_key: true, index: true
      
      t.timestamps
    end
  end
end
