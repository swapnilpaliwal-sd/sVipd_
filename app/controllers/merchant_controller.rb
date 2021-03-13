class MerchantController < ApplicationController

  def login
    #if already logged in
    #skip right onto products view
    # else render merchant login
    #
    # hard coding right now

    session[:merchant_id] = 1
    redirect_to products_by_company_id_path
  end
end
