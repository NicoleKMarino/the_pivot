class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all.where(status: "online")
    @locations = location_list
    @industries = industry_list
  end

  def show
    @company = Company.find_by(slug: params[:slug])
    @jobs = @company.jobs.where(status: "available")
  end
end
