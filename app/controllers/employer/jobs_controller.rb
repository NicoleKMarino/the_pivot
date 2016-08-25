class Employer::JobsController < Employer::BaseController
  before_action :set_job, only: [:edit, :update]
  before_action :set_salary, only: [:edit, :new]

  def set_salary
    @salaries = [
      "$20,000-$40,000",
      "$40,000-$60,000",
      "$60,000-$80,000",
      "$80,000-$100,000"
    ]
  end

  def new
    @job = Job.new
    @companies = current_user.companies
  end

  def index
    @companies = current_user.companies
  end

  def destroy
    @job= Job.find(params[:id])
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
    @companies = current_user.companies
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

end
