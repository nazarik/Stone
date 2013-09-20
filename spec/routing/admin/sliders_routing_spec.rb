require "spec_helper"

describe Admin::SlidersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/sliders").should route_to("admin/sliders#index")
    end

    it "routes to #new" do
      get("/admin/sliders/new").should route_to("admin/sliders#new")
    end

    it "routes to #show" do
      get("/admin/sliders/1").should route_to("admin/sliders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/sliders/1/edit").should route_to("admin/sliders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/sliders").should route_to("admin/sliders#create")
    end

    it "routes to #update" do
      put("/admin/sliders/1").should route_to("admin/sliders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/sliders/1").should route_to("admin/sliders#destroy", :id => "1")
    end

  end
end
