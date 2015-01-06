class Admin::FeedbacksController < Admin::BaseController
  load_and_authorize_resource

  def index
    @feedbacks = Feedback.already_seen(params[:watched])
  end

  def show
    @feedback.update_attribute(:watched, true) unless @feedback.watched
  end

  def destroy
    @feedback.destroy
    flash[:notice] = "Feedback was successfully deleted"
    redirect_to admin_feedbacks_path
  end
end
