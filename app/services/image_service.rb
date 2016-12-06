class ImageService

	def initialize
		uri = URI(ENV['api_url'])
		response = Net::HTTP.get_response(uri)
		@data = response.code == "200" ? JSON.parse(response.body)['works']['work'] : response.message
		# @data = JSON.parse(File.read('works.json'))['works']['work']
	end

	# returns all images array and makes/model hash for dropdown
	def get_images_data						
		{ payload: { 'makes' => makes_dropdown, 'images' => images_array('none').compact}, success: true}
	end

	# returns all images array with 'id' model or make and makes/model hash for dropdown
	def get_hash(key, id)		
		{ payload: { 'makes' => makes_dropdown, 'images' => images_array(key, id).compact.take(10), 'selected_key' => id}, success: true}
	end

	##
	# returns images array from @data
	# conditional check: either of given model or given make or all
	##
	def images_array(condition, value = nil)
		@data.collect do |image| 
			@image = image
			if (condition == 'make' and _make == value) || (condition == 'model' and _model == value) || (condition == 'none')
				image_object
			end
		end
	end

	# returns make/model dropdown from @data object
	def makes_dropdown
		makes = {}
		@data.each do |image|
			@image = image
			model = _model
			make = _make
			makes[make] = makes[make] ?  {'models' => makes[make]['models'] | [model]} : { 'models' => [model]}
		end
		makes
	end

private

	def _model
		(@image['exif']['model'] && @image['exif']['model'].upcase) || nil
	end

	def _make
		(@image['exif']['make'] && @image['exif']['make'].upcase) || nil
	end

	def small_url
		@image['urls']['url'][0]['link'] || ""
	end

	def medium_url
		@image['urls']['url'][1]['link'] || ""
	end

	def large_url
		@image['urls']['url'][2]['link'] || ""
	end

	def filename
		@image['filename'] || ""
	end

	def id
		@image['id'] || ""
	end

	def image_object
		{
			'id' => id,
			'filename' => filename,
			'small_url'=> small_url,
			'medium_url'=> medium_url,
			'large_url' => large_url,
			'model' => _model,
			'make' => _make,

		}
	end

end