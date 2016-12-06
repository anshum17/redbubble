RSpec.describe ImagesController, :type => :controller do
	
  describe "GET #index" do
    it "should get all images with 200" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "GET #model" do
    it "should return 400 bad request for random model id" do
      get :model, {a: 'wrong param key'}
      expect(response).to have_http_status(400)
    end

    it 'should render images with given model' do
      get :model, {q: 'some_model'}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:model)
    end
  end

  describe "GET #make" do
    it "should return 400 for random make id" do
      get :make, {a: 'wrong param key'}
      expect(response).to have_http_status(400)
    end

    it 'should render images with given make' do
      get :make, {q: 'some_make'}
      expect(response).to have_http_status(200)
      expect(response).to render_template(:make)
    end
  end
end