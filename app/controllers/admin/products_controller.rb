class Admin::ProductsController < Admin::BaseController
  load_and_authorize_resource

  def index
    @products = Product.filter_by_category(params[:category_id])
  end

  def new
  end

  def create
    if @product.save
      flash[:notice] = "Successfully created product"
      redirect_to [:admin, @product]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes params[:product]
      flash[:notice] = "Succeallssfully updated product"
      redirect_to [:admin, @product]
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product was successfully deleted"
    redirect_to admin_products_path
  end
end
