class CameraMake < ApplicationRecord

	has_many :camera_models
	has_many :images
end
