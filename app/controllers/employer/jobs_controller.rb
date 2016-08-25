class Employer::JobsController < Employer::BaseController
  before_action :set_job, only: [:edit, :update, :destroy]
  before_action :set_salary, only: [:edit, :new, :create, :update]
  before_action :set_companies

  def new
    @job = Job.new
  end

  def index
  end

  def destroy
    @job.destroy
    flash[:success] = "You've deleted job #{@job.title}."
    redirect_to employer_jobs_path
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = 'Job added successfully'
      redirect_to employer_jobs_path
    else
      flash.now[:danger] = @job.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update(job_params)
      flash[:success] = "#{@job.title} updated successfully."
      redirect_to employer_jobs_path
    else
      flash.now[:danger] = @job.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,
                                 :description,
                                 :salary,
                                 :company_id)
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def set_salary
    @salaries = [
      "$20,000-$40,000",
      "$40,000-$60,000",
      "$60,000-$80,000",
      "$80,000-$100,000"
    ]
  end

  def set_companies
    @companies = current_user.companies
  end

end
