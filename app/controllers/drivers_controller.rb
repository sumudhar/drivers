class DriversController < ApplicationController
  before_action :set_driver, only: [:location_update]
  respond_to :json


  # GET /drivers.json
  def drivers_list
    @drivers = Driver.all
  end


  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def location_update
    location ={}
    if params[:driver_params].present?
      location['accuracy']  = params[:driver_params][:accuracy]
      location['longitude'] = params[:driver_params][:longitude]
      location['latitude']  = params[:driver_params][:latitude]
    else
      return  render  json: "Location details are not found".as_json, status: :unprocessable_entity
    end
    unless @driver.nil?
        # check the location is exists or not ..
      unless @driver.location.nil?
           @driver.build_location(location)
      else
           @driver.update_attributes(location_attributes:  location)
      end
         if @driver.save
          render body: nil, status: :ok
         else
          render json: @driver.errors.as_json, status: :unprocessable_entity
         end
      else
        render json: "Record not Found".as_json, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
       @driver = Driver.find(params[:id])
    end


end
