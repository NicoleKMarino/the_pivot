class JobsController < ApplicationController



  def index
    @jobs = Job.where(status: 0)
    @locations = @jobs.map { |job| job.company.location }.uniq
  end

  def unavailable
    @jobs = Job.where(status: 1)
  end

  def show
    @job = Job.find(params[:id])
  end

end
