class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_categories

private
  def load_categories
    @categories = Category.with_products
  end
end
