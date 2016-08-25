class Admin::CompaniesController < Admin::BaseController

  def index
    @companies = Company.where(status: 0)
  end

  def update
    @company = Company.find(params[:id])
    if @company.status == "online"
        @company.update_attributes(status: "offline")
        @company.jobs.update_all(status: 1)
      flash[:success] = "#{@company.name} Now Offline"
      redirect_to company_path(@company.slug)
    else
      @company.status == "offline"
      @company.update_attributes(status: "online")
      @company.jobs.update_all(status: 0)
      flash[:success] = "#{@company.name} Now Online"
      redirect_to admin_companies_path
    end
  end
end
