# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  :2.25 ,Rails:- 5.0.1

* System dependencies : 

* Configuration

* Database creation   :  
  rails db:create 
  rails db:migrate
  rails db:seed Rails.env 'test' for the longitude and latitude data seeding to run rspec

* Database initialization

* How to run the test suite
   rspec  this will run all the test cases I have covered for location as well as driver 
   for run individual tests 
      rspec ./spec/controllers/drivers_controller_spec.rb 
      rspec ./spec/models/driver_spec.rb
      rspec ./spec/models/location_spec.rb 

* Services (job queues, cache servers, search engines, etc.)
   
* Deployment instructions

* ...
Note:-  calculation of longitude and latitude done based on formula and that returns in meters. 
        I cross verified result with available tools.
        