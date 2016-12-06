RSpec.describe ImageService, :type => :service do

	before(:all) do 
		@imageservice = ImageService.new()
	end

	describe " #get_images_data" do
    it "should get all images" do
      response = @imageservice.get_images_data
      expect(response.keys()).to eq([:payload, :success])
      result = response[:payload]
      expect(result.keys()).to eq(["makes", "images"])
    end
  end

  describe " #get_hash" do
    it "should get all images with given make" do
    	response = @imageservice.get_images_data
    	make = response[:payload]["makes"].keys().first
      response = @imageservice.get_hash('make', make)
      expect(response.keys()).to eq([:payload, :success])
      result = response[:payload]
      expect(result.keys()).to eq(["makes", "images", "selected_key"])
      expect(result["selected_key"]).to eq(make)
    end

    it "should get all images with given model" do
    	response = @imageservice.get_images_data
    	make = response[:payload]["makes"].keys().first
    	model = response[:payload]["makes"][make]["models"].first
      response = @imageservice.get_hash('model', model)
      expect(response.keys()).to eq([:payload, :success])
      result = response[:payload]
      expect(result.keys()).to eq(["makes", "images", "selected_key"])
      expect(result["selected_key"]).to eq(model)
    end

    it "should return empty images array, with random make id" do
    	response = @imageservice.get_hash('make', 'random_make')
      expect(response.keys()).to eq([:payload, :success])
      result = response[:payload]
      expect(result.keys()).to eq(["makes", "images", "selected_key"])
      expect(result["images"].length).to eq(0)
    end

    it "should return empty images array, with random model id" do
    	response = @imageservice.get_hash('model', 'random_model')
      expect(response.keys()).to eq([:payload, :success])
      result = response[:payload]
      expect(result.keys()).to eq(["makes", "images", "selected_key"])
      expect(result["images"].length).to eq(0)
    end
  end

  describe " #images_array" do
    it "should return empty images array, with random key" do
    	response = @imageservice.images_array('random_key').compact  
      expect(response.length).to eq(0)      
    end
  end
end