class ImageService

	def initialize
		@data = JSON.parse(File.read('works.json'))['works']['work']
	end

	def get_images_data				
		# uri = URI('http://take-home-test.herokuapp.com/api/v1/works.json')
		# response = Net::HTTP.get_response(uri)
		# payload = response.code == "200" ? JSON.parse(response.body) : response.message
		to_hash(@data)
	end

	def models_hash(id)
		# models = {}
		makes = {}
		images = []
		@data.each do |obj|
			@image = obj
			image_id = obj['id']
			model = _model
			make = _make
			images = (model == id) ? images + [image_object] : images
			makes[make] = makes[make] ?  { 'models' => makes[make]['models'] | [model]} : { 'models' => [model] }
			# makes[make] = makes[make] ?  { 'image_ids' => makes[make]['image_ids'] | [image_id], 'models' => makes[make]['models'] | [model]} : { 'image_ids' => [image_id], 'models' => [model]}
		end
		{
			'makes' 				=> makes,
			'images'				=> images.take(10),
			'selected_model' => id
		}
	end

	def makes_hash(id)
		makes = {}
		images = []
		@data.each do |obj|
			@image = obj
			image_id = obj['id']
			model = _model
			make = _make
			images = (make == id) ? images + [image_object] : images
			makes[make] = makes[make] ?  { 'image_ids' => makes[make]['image_ids'] | [image_id], 'models' => makes[make]['models'] | [model]} : { 'image_ids' => [image_id], 'models' => [model]}
		end
		{
			'makes' 				=> makes,
			'images'				=> images.take(10),
			'selected_make' => id
		}
	end

	def images_array
		images = []
		@data.each do |image|
			@image = image
			images += [image_object]
		end
		images
	end

	def to_hash(arr)
		images = []
		models = {}
		makes = {}
		arr.each do |image|
			@image = image
			id = image['id']
			model = _model
			make = _make
			images = images + [image_object]
			models[model] = { 'image_ids' => models[model] ? models[model]['image_ids'] | [id] : [id], 'make' => make}
			makes[make] = makes[make] ?  { 'image_ids' => makes[make]['image_ids'] | [id], 'models' => makes[make]['models'] | [model]} : { 'image_ids' => [id], 'models' => [model]}
		end
		{
			'images' => images.take(10),
			'models'=> models,
			'makes' => makes
		}
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