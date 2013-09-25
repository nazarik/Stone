class HomePagesController < ApplicationController
  def index
    @sliders = Slider.all
    # @categories = Category.with_products
    @recent_products = Product.recent
  end
end
