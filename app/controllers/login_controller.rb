class LoginController < ApplicationController

  def merchant_login
  end

  def merchant_login_post
    #insert authentication here, later

    merchants = Company.where(name: params[:username])
    count = merchants.all.count

    if count > 0
      session[:merchant_id] =  merchants.first.company_id
      redirect_to merchant_index_path
    else
      redirect_to merchant_login_path
    end

    #session[:merchant_id] = 1
    #redirect_to products_by_company_id_path
  end
end
