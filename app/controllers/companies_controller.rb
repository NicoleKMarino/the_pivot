class CompaniesController < ApplicationController

  def index
    @companies = Company.all.where(status: 2)
  end

  def show
    @company = Company.find_by(slug: params[:name])
    if @company.nil?
      redirect_to items_path
    else
      @jobs = @company.jobs.where(status: 0)
    end
  end
  
end
