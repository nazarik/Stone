class FeedbacksController < ApplicationController
  def index
    @feedback = Feedback.new
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      render :create
    else
      render :new
    end
  end
end
