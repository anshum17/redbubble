class ImageService

	def initialize
		# uri = URI('http://take-home-test.herokuapp.com/api/v1/works.json')
		# response = Net::HTTP.get_response(uri)
		# payload = response.code == "200" ? JSON.parse(response.body) : response.message
		@data = JSON.parse(File.read('works.json'))['works']['work']
	end

	def get_images_data						
		{
			'images' => images_array('none').compact.take(10),
			'makes' => makes_dropdown
		}
	end

	def models_hash(id)
		{
			'makes' 				=> makes_dropdown,
			'images'				=> images_array('model', id).compact.take(10),
			'selected_model' => id
		}
	end

	def makes_hash(id)
		{
			'makes' 				=> makes_dropdown,
			'images'				=> images_array('make', id).compact.take(10),
			'selected_make' => id
		}
	end

	def images_array(condition, value = nil)
		@data.collect do |image| 
			@image = image
			if (condition == 'make' and _make == value) || (condition == 'model' and _model == value) || (condition == 'none')
				image_object
			end
		end
	end

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



	# def to_hash(arr)
	# 	images = []
	# 	makes = {}
	# 	arr.each do |image|
	# 		@image = image
	# 		model = _model
	# 		make = _make
	# 		images = images + [image_object]
	# 		makes[make] = makes[make] ?  {'models' => makes[make]['models'] | [model]} : { 'models' => [model]}
	# 	end
	# 	{
	# 		'images' => images.take(10),
	# 		'makes' => makes
	# 	}
	# end

end