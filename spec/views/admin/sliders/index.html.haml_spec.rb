require 'spec_helper'

describe "admin/sliders/index" do
  before(:each) do
    assign(:admin_sliders, [
      stub_model(Admin::Slider),
      stub_model(Admin::Slider)
    ])
  end

  it "renders a list of admin/sliders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
