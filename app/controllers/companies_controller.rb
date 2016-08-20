class CompaniesController < ApplicationController

  def index
    @companies = Company.all.where(status: 2)
  end

  def show
    @company = Company.find_by_slug(params[:company_slug])
    if @company.nil?
      redirect_to companies_path
    else
      @jobs = @company.jobs.where(status: 0)
    end
  end

end
