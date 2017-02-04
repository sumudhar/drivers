require 'rails_helper'

RSpec.describe "drivers/edit", type: :view do
  before(:each) do
    @driver = assign(:driver, Driver.create!(
      :last_name => "MyString",
      :first_name => "MyString",
      :phone => "MyString"
    ))
  end

  it "renders the edit driver form" do
    render

    assert_select "form[action=?][method=?]", driver_path(@driver), "post" do

      assert_select "input#driver_last_name[name=?]", "driver[last_name]"

      assert_select "input#driver_first_name[name=?]", "driver[first_name]"

      assert_select "input#driver_phone[name=?]", "driver[phone]"
    end
  end
end
