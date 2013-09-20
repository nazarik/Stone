class HomePagesController < ApplicationController
  def index
    @sliders = Slider.all
    @categories = Category.with_products
  end
end
