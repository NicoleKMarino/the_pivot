class JobsController < ApplicationController

  def index
    @companies = Company.where(status: 1)
    @locations = location_list
    @salaries = salary_list
  end

  def show
    @job = Job.find(params[:id])
  end
end
