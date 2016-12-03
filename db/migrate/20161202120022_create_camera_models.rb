class CreateCameraModels < ActiveRecord::Migration[5.0]
	def change
		create_table :camera_models do |t|
			t.string :name
			t.references :camera_make

			t.timestamps
		end
	end
end
