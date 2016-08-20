class CompaniesController < ApplicationController

  def index
    @companies = Company.all.where(status: 2)
    @locations = location_list
  end

  def show
    @company = Company.find(params[:id])
    if @company.nil?
      redirect_to companies_path
    else
      @jobs = @company.jobs.where(status: 0)
    end
  end

  private

  def location_list
    @companies.map { |company| company.location }.uniq
  end

end
