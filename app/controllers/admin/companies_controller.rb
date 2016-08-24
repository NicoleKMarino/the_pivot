class Admin::CompaniesController < Admin::BaseController
  def index
    @companies = Company.all.where(status:0)
  end

  def update
    @company = Company.find(params[:id])
    @company.update(status: 1)
    redirect_to admin_companies_path
  end

end
