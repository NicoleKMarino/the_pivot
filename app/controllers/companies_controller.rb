class CompaniesController < ApplicationController

  def show
    @company = Company.find_by(slug: params[:name])
    if @company.nil?
      redirect_to companies_path
    else
      @jobs = @company.jobs.where(status: 0)
    end
  end

  def index
    @companies = Company.all.where(status: 2)
  end

end
