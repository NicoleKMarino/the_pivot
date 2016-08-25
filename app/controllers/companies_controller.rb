class CompaniesController < ApplicationController
  
  def index
    @companies = Company.all.where(status: 1)
    @locations = location_list
    @industries = industry_list
  end

  def show
    @company = Company.find_by(slug: params[:slug])
    @jobs = @company.jobs.where(status: 0)
  end
end
