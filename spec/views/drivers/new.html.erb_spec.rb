require 'rails_helper'

RSpec.describe "drivers/new", type: :view do
  before(:each) do
    assign(:driver, Driver.new(
      :last_name => "MyString",
      :first_name => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders new driver form" do
    render

    assert_select "form[action=?][method=?]", drivers_path, "post" do

      assert_select "input#driver_last_name[name=?]", "driver[last_name]"

      assert_select "input#driver_first_name[name=?]", "driver[first_name]"

      assert_select "input#driver_phone[name=?]", "driver[phone]"
    end
  end
end
