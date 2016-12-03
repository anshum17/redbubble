Rails.application.routes.draw do
  

	get '/' => 'images#index'

	get '/make' => 'images#make'

	get '/model' => 'images#model'
end
