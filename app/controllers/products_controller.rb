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
    product_info = params[:product]
    product_info[:price] = product_info[:price].to_f
    product_info[:stock_count] = product_info[:stock_count].to_i
    product_info[:company_id] = product_info[:company_id].to_i
    puts "Params!::::"
    puts "#{product_info}"
    
    @product = Product.create!(params[:product_info])
    flash[:notice] = "#{@product.name} was successfully created."
    redirect_to products_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:product).permit(:name, :description, :price, :stock_count, :company_id)
  end
end
