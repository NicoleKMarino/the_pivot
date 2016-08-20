class Admin::JobsController < Admin::BaseController
  before_action :set_job, only: [:edit, :update]

  def new
    @job = Job.new
  end

  # def index
  #   @jobs = Job.all.where(status: 0)
  # end
  # uncomment when you write a test 

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = 'Job added successfully'
      redirect_to @job
    else
      flash.now[:danger] = @job.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update_attributes(job_params)
      flash[:success] = "#{@job.title} updated successfully."
      @job.update_image_path
      redirect_to @job
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
    @job = job.find(params[:id])
  end

end
