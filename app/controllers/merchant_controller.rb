class MerchantController < ApplicationController

  helper_method :initial_sorting_merchant_login, :direction_asc
  def index
    @company = Company.find(session[:merchant_id])
    @products = Product.where(company_id: session[:merchant_id]).order(initial_sorting_merchant_login + " " + direction_asc)
    @product_count =  Product.where(company_id: session[:merchant_id]).count

    if Story.where(company_id: session[:merchant_id]).all.nil?

      #Unsure here
      @stories = nil
    else
      @stories = Story.where(company_id: session[:merchant_id]).all
    end

    @story_count = Story.all.count

  end

  def stories
    @stories = Story.where(company_id: session[:merchant_id]).all
    @company = Company.find(session[:merchant_id])
  end





  private

  def initial_sorting_merchant_login
    params[:sort] || "name"
  end

  def direction_asc
    params[:direction] || "asc"
  end


end
