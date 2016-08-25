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

  private

    def salary_list
      @jobs = Job.all
      @jobs.map { |job| job.salary }.uniq
    end

    def location_list
      @companies.map { |company| company.location }.uniq
    end
end
