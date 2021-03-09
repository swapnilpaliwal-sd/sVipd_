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
    puts "Params!::::"
    puts "#{params[:product]}"
    
    @product = Product.create!(params[:product])
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
    params.require(:product).permit(:name, :description, :price, :stock)
  end
end
