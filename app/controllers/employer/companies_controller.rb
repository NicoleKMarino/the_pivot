class Employer::CompaniesController < Employer::BaseController
  before_action :set_states, only: [:edit, :new]


  def set_states
    @states = [ "Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado", "Connecticut", "DC", "Delaware", "Florida", "Georgia", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"]
  end

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
