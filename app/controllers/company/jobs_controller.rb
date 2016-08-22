class Company::JobsController < ApplicationController
  def index
    @jobs = Company.find_by(slug: params[:slug]).jobs
  end
end
