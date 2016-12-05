# README

This test app is serving camera images with makes and models. You can browse images with many camera makes or models.
For this app I have used Ruby on Rails, since I have worked with ROR in past so I had good idea of its structure and functionality of template rendering. You should be able to browse to any camera make or model from any page using dropdown. Under every image you can see its make and model as well. If you click it, it will take you to all the images of that camera make/model.

There are 3 controller actions each for index(main) page, camera make page and camera model page. Controller action will call its service class. Service class will fetch data from API provided, and return respective objects to controller, which will pass it to respective views to render appropriate html template.

[![Code Climate](https://codeclimate.com/repos/584453c0a393ef79330033d2/badges/44bc589903bd43316aa5/gpa.svg)](https://codeclimate.com/repos/584453c0a393ef79330033d2/feed)


**Setup(Locally on Mac OS)** // For Ubuntu, follow this [article](http://railsapps.github.io/install-ruby.html)

**Prerequisites:** rvm, ruby, rails, xcode

**Xcode:**
`xcode-select --install`

**Homebrew:**
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

**Install rvm:**
	
`gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable`

**Upgrade to Ruby 2.3.1:**
`rvm install ruby-2.3.1
rvm --default use ruby-2.3.1
source ~/.rvm/scripts/rvm`

**Rails 5:**
`rvm use ruby-2.3.1@rails5.0 --create
gem install rails`

**How to run the test suite:**
run command `rspec` on terminal

**How to start rails server:**
run command `rails s` on terminal


#####DOCUMENTATION:
1. Services:
	1. The application business logic should reside here
	2. Should follow single responsibility principle

2. Controllers:
	1. controller Actions:
	2. should just call a service object function to get a response object
	3. Should be THIN, no business logic here
	4. This layer should never directly interact with model layer

3. Api level documentation required.
	1. Should include the request and response as example when ever applicable