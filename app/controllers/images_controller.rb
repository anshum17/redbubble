class ImagesController < ApplicationController

	require 'net/http'
	require 'json'	

	def index
		@data = ImageService.new().get_images_data
		# render json:  @data, status: 200
	end

	def make
		@data = ImageService.new().makes_hash(params[:q])
		# render json:  @data, status: 200
	end

	def model
		@data = ImageService.new().models_hash(params[:q])
		# render json:  @data, status: 200
	end
end
