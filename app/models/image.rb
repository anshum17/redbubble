class Image < ApplicationRecord

	belongs_to :camera_make
	belongs_to :camera_model
end
