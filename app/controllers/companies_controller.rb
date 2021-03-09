class CompaniesController < ApplicationController

  def show
    id = params[:id]
    @company = Company.find(id)
  end

  def index
    @companies = Company.all
  end
 # def initialize
    
 # end

  def new
    # default: render 'new' template
  end

  def create
    @company = Company.create!(company_params)
    flash[:notice] = "#{@company.name} was successfully created."
    redirect_to companies_path
  end

  def edit
    @company = Company.find params[:id]
  end

  def update
    @company = Company.find params[:id]
    @company.update_attributes!(company_params)
    flash[:notice] = "#{@company.name} was successfully updated."
    redirect_to product_path(@company)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    flash[:notice] = "Product '#{@company.name}' deleted."
    redirect_to products_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def company_params
    params.require(:company).permit(:name, :description, :longitude, :latitude)
  end
end
