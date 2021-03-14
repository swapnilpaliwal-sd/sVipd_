class StoriesController < ApplicationController
  def show
    @story = Story.find(params[:id])
  end
  def index
    @storiess = Story.last(10).reverse
  end

  def new

  end

  def create
    @story = Story.new(params.require(:story).permit(:merchant, :product_title, :description, :image))
    @story.save
    redirect_to story_path(@story)
  end

end
