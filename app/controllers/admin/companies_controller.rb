class Admin::CompaniesController < Admin::BaseController
  def index
    @companies = Company.all.where(status: 0)
  end

  def update
    @company = Company.find(params[:id])
    if params[:status] == "1"
      @company.update(status: 1)
      flash[:success] = "#{@company.name} Now Online"
      redirect_to company_path(@company.slug)
    else
      @company.update(status: 0)
      flash[:success] = "#{@company.name} Now Offline"
      redirect_to admin_companies_path
    end
  end




end
