class HomeController < ApplicationController
  #t
  def index
    @stories = Story.last(10).reverse
  end
end
