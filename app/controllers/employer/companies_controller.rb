class Employer::CompaniesController < Employer::BaseController
  before_action :set_states, only: [:new, :create]

  def new
    @industries = Industry.all
    @company = Company.new
  end

  def create
    @company = current_user.companies.create(company_params)
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

    def set_states
      @states = [
        "Alaska",
        "Alabama",
        "Arkansas",
        "Arizona",
        "California",
        "Colorado",
        "Connecticut",
        "DC",
        "Delaware",
        "Florida",
        "Georgia",
        "Hawaii",
        "Iowa",
        "Idaho",
        "Illinois",
        "Indiana",
        "Kansas",
        "Kentucky",
        "Louisiana",
        "Massachusetts",
        "Maryland",
        "Maine",
        "Michigan",
        "Minnesota",
        "Missouri",
        "Mississippi",
        "Montana",
        "North Carolina",
        "North Dakota",
        "Nebraska",
        "New Hampshire",
        "New Jersey",
        "New Mexico",
        "Nevada",
        "New York",
        "Ohio",
        "Oklahoma",
        "Oregon",
        "Pennsylvania",
        "Rhode Island",
        "South Carolina",
        "South Dakota",
        "Tennessee",
        "Texas",
        "Utah",
        "Virginia",
        "Vermont",
        "Washington",
        "Wisconsin",
        "West Virginia",
        "Wyoming"
      ]
    end
end
