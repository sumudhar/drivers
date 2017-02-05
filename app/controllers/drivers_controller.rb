class DriversController < ApplicationController
  before_action :set_driver, only: [:location_update]
  respond_to :json


  # GET /drivers.json
  def drivers_list

    #binding.pry
    request_obj = {}
    request_obj['longitude']= params[:longitude].to_f
    request_obj['latitude']= params[:longitude].to_f
    request_obj['radius']= params[:radius]
    request_obj['limit']= params[:limit]
   # valid = is_request_valid?(request_obj)
    unless request_obj.blank?
      # filter that the request is valid or not
      unless (request_obj['longitude']>= -180 and request_obj['longitude'] <=180)
        return render json: " Longitude should  be between [+/- 180]"
      end
      unless (request_obj['latitude']>= -90 and request_obj['latitude'] <=90)
        return render json: " Latitude should be  between [+/-90 ]"
      end
       drivers = Driver.get_details(request_obj)
      binding.pry
    else
      render json: "Invalid request".as_json, status: :bad_request
    end
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
      if @driver.location.nil?
          @driver.build_location(location)
      else
          @driver.update_attributes(location_attributes:  location)
      end
    end
    if @driver.save
      render body: nil, status: :ok
    else
      render json: @driver.errors.as_json, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
       @driver = Driver.find(params[:id])
    end

    def is_request_valid(request_obj)
      return false if request_obj.blank?
      return false if request_obj['longitude'].nil?
      return false if request_obj['latitude'].nil?
      true
    end

end
