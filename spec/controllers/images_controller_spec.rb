RSpec.describe ImagesController, :type => :controller do
	describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #model" do
    it "responds successfully with an HTTP 200 status code" do
      get :model
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #make" do
    it "responds successfully with an HTTP 200 status code" do
      get :make
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end