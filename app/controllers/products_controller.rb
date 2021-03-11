class ProductsController < ApplicationController

  def show
    id = params[:id]
    @product = Product.find(id)
    puts "Company ID #{@product.company_id}"
    @company = Company.find(@product.company_id)

    @product
  end

  def index
    search = params[:search]
    @products = Product.all
    if search != nil
      s = search["search"]
      @products = Product.where("name LIKE '%#{s}%' OR description LIKE '%#{s}%' ").order(:price)
    end
    @companies = Company.all
    @company_for_product = Hash.new
    @products.each do |p| 
      puts "product: #{p.inspect}"
      @company_for_product[p.pid] = @companies.find(p.company_id).name
    end
    @companies.each do |p| 
      puts "Company: #{p.inspect}"
    end
  end
 # def initialize
    
 # end

  def new
    # default: render 'new' template
  end

  def create
    begin
      @product = Product.create!(product_params)
      flash[:notice] = "#{@product.name} was successfully created."
      redirect_to products_path
    rescue => err
      flash[:notice] = "Error creating: #{err}"
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    begin
      @product = Product.find params[:id]
      @product.update_attributes!(product_params)
      flash[:notice] = "#{@product.name} was successfully updated."
      redirect_to product_path(@product)
    rescue => err
      flash[:notice] = "Error updating: #{err}"
      redirect_to products_path
    end
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
