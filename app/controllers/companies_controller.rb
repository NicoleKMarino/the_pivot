class CompaniesController < ApplicationController

  def index
    @companies = Company.all.where(status:0)
    @locations = location_list
    @industries = industry_list
  end

  def show
    @company = Company.find_by(slug: params[:slug])
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

    def industry_list
      @companies.map { |company| company.industry.name }.uniq
    end
end
