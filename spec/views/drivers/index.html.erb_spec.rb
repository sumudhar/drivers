require 'rails_helper'

RSpec.describe "drivers/index", type: :view do
  before(:each) do
    assign(:drivers, [
      Driver.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :phone => "Phone"
      ),
      Driver.create!(
        :last_name => "Last Name",
        :first_name => "First Name",
        :phone => "Phone"
      )
    ])
  end

  it "renders a list of drivers" do
    render
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
  end
end
