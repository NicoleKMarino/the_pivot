class JobsController < ApplicationController
  def index
    @jobs = Job.where(status: 0)
    @locations = location_list
    @salaries = salary_list
  end

  def unavailable
    @jobs_unavailable = Job.where(status: 1)
  end

  def show
    @jobs = Job.find(params[:id])
  end

  private

  def salary_list
    @jobs.map { |job| job.salary }.uniq
  end

  def location_list
    @jobs.map { |job| job.company.location }.uniq
  end
end
