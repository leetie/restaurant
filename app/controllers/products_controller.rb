class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  load_and_authorize_resource
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
      flash[:notice] = "Product Created"
    else
      render :new
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price, :picture)
    end

end
