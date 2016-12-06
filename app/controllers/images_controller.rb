class ImagesController < ApplicationController

	# require 'net/http'
	# require 'json'	

	# @url /
	# @action GET
	#
	# Fetches the list of all images with info
	#
	# @response [html] serving the images
	#
	# @example_request_description
	# @example_request
	# ```
	# {
	#
	# }
	#
	# @example_response_description the response contains images array and makes hash
	# @example_response
	#   ```
	#   {
	#     'images' => [],
	#	  'makes' => {}
	#   }
	#   ```
	def index
		@data = ImageService.new().get_images_data
	end

	# @url /make
	# @action GET
	#
	# Fetches the list of all images of given make
	#
	# @response [html] serving the images
	#
	# @example_request_description name of make
	# @example_request
	# ```
	# {
	#     'q' => 'make_name'
	# }
	#
	# @example_response_description the response contains images array, makes hash and selected make
	# @example_response
	#   ```
	#   {
	#     'images' => [],
	#	  'makes' => {},
	#     'selected_key' => 'make'   
	#   }
	#   ```
	def make
		if !check_params ['q']
			render :file => 'public/400.html', :status => :bad_request, :layout => false
		end 
		@data = ImageService.new().get_hash('make', params[:q])
	end

	# @url /model
	# @action GET
	#
	# Fetches the list of all images of given model
	#
	# @response [html] serving the images
	#
	# @example_request_description name of model
	# @example_request
	# ```
	# {
	#     'q' => 'model_name'
	# }
	#
	# @example_response_description the response contains images array, makes hash and selected model
	# @example_response
	#   ```
	#   {
	#     'images' => [],
	#	  'makes' => {},
	#     'selected_key' => 'make'
	#   }
	#   ```
	def model
		if !check_params ['q']
			render :file => 'public/400.html', :status => :bad_request, :layout => false
		end 
		@data = ImageService.new().get_hash('model', params[:q])
	end
end
