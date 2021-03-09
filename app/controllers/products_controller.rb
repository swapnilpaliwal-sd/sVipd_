class ProductsController < ApplicationController

  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def index
    @products = Product.all
  end
 # def initialize
    
 # end

  def new
    # default: render 'new' template
  end

  def create
    @product = Product.create!(product_params)
    flash[:notice] = "#{@product.name} was successfully created."
    redirect_to products_path
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update_attributes!(product_params)
    flash[:notice] = "#{@product.name} was successfully updated."
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product '#{@product.name}' deleted."
    redirect_to products_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_count, :company_id)
  end
end
