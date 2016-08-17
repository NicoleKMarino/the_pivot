class JobsController < ApplicationController



  def index
    @jobs = Job.where(status: 0)
  end

  def unavailable
    @jobs = Job.where(status: 1)
  end

  def show
    @job = Job.find(params[:id])
  end

end
