require 'spec_helper'

describe "admin/sliders/edit" do
  before(:each) do
    @admin_slider = assign(:admin_slider, stub_model(Admin::Slider))
  end

  it "renders the edit admin_slider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_slider_path(@admin_slider), "post" do
    end
  end
end
