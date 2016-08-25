class Admin::EmployersController < Admin::BaseController

  def index
    @employers = []
    User.all.each do |user|
      if user.roles.first.name == "employer"
        @employers << user
      end
    end
    @employers
  end

  def update
    @employer = User.find(params[:id])
    if @employer.status == "online"
      @employer.update_attributes(status: "offline")
      @employer.companies.update_all(status: "offline")
    else
      @employer.update_attributes(status: "online")
      @employer.companies.update_all(status: "online")
    end
    redirect_to admin_employers_path
  end
end
