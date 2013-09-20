class Admin::SlidersController < Admin::BaseController
  load_and_authorize_resource

  def index
    @sliders = Slider.all
  end

  def new
  end

  def create
    if @slider.save
      flash[:notice] = "Successfully created slider"
      redirect_to [:admin, @slider]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @slider.update_attributes params[:slider]
      flash[:notice] = "Successfully updated slider"
      redirect_to [:admin, @slider]
    else
      render :edit
    end
  end

  def destroy
    @slider.destroy
    flash[:notice] = "Slider was successfully deleted"
    redirect_to admin_sliders_path
  end
end
