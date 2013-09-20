require 'spec_helper'

describe "admin/sliders/new" do
  before(:each) do
    assign(:admin_slider, stub_model(Admin::Slider).as_new_record)
  end

  it "renders new admin_slider form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_sliders_path, "post" do
    end
  end
end
