class Employer::CompaniesController < Employer::BaseController

  def new
    @industries = Industry.all
    @company = Company.new
  end

  def create
    company_hash = company_params
    company_hash[:user_id] = current_user.id
    @company = Company.new(company_hash)
    if @company.save
      flash[:success] = "Company added successfully"
      redirect_to company_path(@company.slug)
    else
      flash.now[:danger] = "Missing required fields. Please re-enter your company information."
      render :new
    end
  end

  private

    def company_params
      params.require(:company).permit(:name,
                                   :description,
                                   :location,
                                   :img_path,
                                   :industry_id
                                   )
    end
end
