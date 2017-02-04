require 'rails_helper'

RSpec.describe Driver, type: :model do

  before :each do
    @driver = FactoryGirl.build(:driver)
  end

  after :each do
    # this test uses the db storage for uniqueness testing, so need to clean between runs
    DatabaseCleaner.clean
  end

  describe "#valid" do
    it "should require first_name" do
      expect(@driver.valid?).to eq(true)
      @driver.first_name = nil
      expect(@driver.valid?).to eq(false)
    end

    it "should require a last_name" do
      expect(@driver.valid?).to eq(true)
      @driver.last_name = nil
      expect(@driver.valid?).to eq(false)
    end

    it "should require a phone" do
      expect(@driver.valid?).to eq(true)
      @driver.phone = nil
      expect(@driver.valid?).to eq(false)
    end
  end
end
