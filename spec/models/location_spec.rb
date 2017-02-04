require 'rails_helper'

RSpec.describe Location, type: :model do
  before :each do
    @location = FactoryGirl.create(:valid_location)
  end

  after :each do
    # this test uses the db storage for uniqueness testing, so need to clean between runs
    DatabaseCleaner.clean
  end

  describe "#valid" do
    it "should require longitude" do
      expect(@location.valid?).to eq(true)
      @location.longitude = nil
      expect(@location.valid?).to eq(false)
    end

    it "should require a latitude" do
      expect(@location.valid?).to eq(true)
      @location.latitude = nil
      expect(@location.valid?).to eq(false)
    end

    it "should require a accuracy" do
      expect(@location.valid?).to eq(true)
      @location.accuracy = nil
      expect(@location.valid?).to eq(false)
    end

    it "should require  valid driver " do
      expect(@location.valid?).to eq(true)
      @location.driver_id = 500000
      expect(@location.valid?).to eq(false)
    end

    it "should require valid longitude" do
      expect(@location.valid?).to eq(true)
      @location.longitude = -200.9090
      expect(@location.valid?).to eq(false)
    end

    it "should require valid latitude" do
      expect(@location.valid?).to eq(true)
      @location.latitude = -100.1010
      expect(@location.valid?).to eq(false)
    end


  end
end
