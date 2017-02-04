class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all
  end


  # PATCH/PUT /drivers/1
  # PATCH/PUT /drivers/1.json
  def update
    respond_to do |format|
      if @driver.update(driver_params)
        format.json { render :show, status: :ok, location: @driver }
      else
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:last_name, :first_name, :phone)
    end
end
