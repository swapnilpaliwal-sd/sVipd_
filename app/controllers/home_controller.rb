class HomeController < ApplicationController
  
  def index
    @stories = Story.last(10).reverse
  end
end
