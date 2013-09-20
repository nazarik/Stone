require 'spec_helper'

describe "admin/sliders/show" do
  before(:each) do
    @admin_slider = assign(:admin_slider, stub_model(Admin::Slider))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
