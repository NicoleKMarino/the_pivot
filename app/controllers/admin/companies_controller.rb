class Admin::CompaniesController < Admin::BaseController

  def index
    @companies = Company.all.where(status: 0)
  end

  def update
    @company = Company.find(params[:id])
    if @company.status == "online"
        @company.update_attributes(status: "offline")
        @company.jobs.update_all(status: "unavailable")
      flash[:success] = "#{@company.name} Now Offline"
      redirect_to company_path(@company.slug)
    else
      @company.update_attributes(status: "online")
      @company.jobs.update_all(status: "available")
      flash[:success] = "#{@company.name} Now Online"
      redirect_to admin_companies_path
    end
  end
end
