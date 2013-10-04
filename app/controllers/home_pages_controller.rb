class HomePagesController < ApplicationController
  def index
    @sliders = Slider.all
    @recent_products = Product.recent
  end
end
