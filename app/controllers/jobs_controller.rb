class JobsController < ApplicationController

  def index
    @companies = Company.all.where(status: 1)
    @locations = location_list
    @salaries = salary_list
  end

  def unavailable
    @jobs_unavailable = Job.where(status: 1)
  end

  def show
    @job = Job.find(params[:id])
  end
end
