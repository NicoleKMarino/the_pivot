class Admin::DashboardController < Admin::BaseController

  def index
    @companies = Company.where(status: 0)
  end
end
