class Employer::CompaniesController < Employer::BaseController

  def new
    @company = Company.new
    @industries = Industry.all
  end

  def create
    company_hash = company_params
    company_hash[:user_id] = current_user.id
    @company = Company.new(company_hash)
    if @company.save
      flash[:success] = 'Company added successfully'
      redirect_to company_path(@company.slug)
    else
      flash.now[:danger] = @company.errors.full_messages.join(', ')
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
