class ProductsController < ApplicationController
  respond_to :html, :js
  
  def index
    @products = Product.paginate(:per_page => 5, :page => params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @products = Product.paginate(:per_page => 5, :page => params[:page])
    @product = Product.create(product_params)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @products = Product.all
    @product = Product.find(params[:id])
    
    @product.update_attributes(product_params)
  end

  def delete
    @product = Product.find(params[:product_id])
  end

  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
  end

private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
