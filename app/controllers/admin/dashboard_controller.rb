class Admin::DashboardController < Admin::BaseController
  
  def index
    @companies = Company.all.where(status:0)
  end
end
