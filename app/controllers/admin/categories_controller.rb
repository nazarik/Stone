class Admin::CategoriesController < Admin::BaseController
  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def new
  end

  def create
    if @category.save
      flash[:notice] = "Successfully created category"
      redirect_to [:admin, @category]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes params[:category]
      flash[:notice] = "Successfully updated category"
      redirect_to [:admin, @category]
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category was successfully deleted"
    redirect_to admin_categories_path
  end
end
