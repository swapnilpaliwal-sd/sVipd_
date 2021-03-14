class MerchantController < ApplicationController

  def index
  end

  def stories
    @stories = Story.where(company_id: session[:merchant_id]).all
    @company = Company.find(session[:merchant_id])
  end
end
