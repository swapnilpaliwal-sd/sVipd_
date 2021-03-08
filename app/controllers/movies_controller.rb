class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    @title_sort = {:sort => 'title'}
    @date_sort = {:sort => 'release_date'}
    @ratings_to_show = []
    
    if params[:ratings] == nil
      if session[:ratings_token] == nil
        session[:ratings_token] = @all_ratings
      end
      @ratings_to_show = session[:ratings_token]
      redirect_to movies_url(sort: params[:sort], ratings: session[:ratings_token].map{ |x| [x, 1] }.to_h)
    else
      @ratings_to_show = params[:ratings].keys
    end
    session[:ratings_token] = @ratings_to_show
    
    movies = []
    movies = Movie.where(rating: session[:ratings_token])
    
    sorting_order = params[:sort]
    if sorting_order == nil
      sorting_order = ''
    end
   
    @movies = movies.all.order(sorting_order)    
  end
 # def initialize
    
 # end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
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
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
