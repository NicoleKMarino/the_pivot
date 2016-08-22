class Store::JobsController < ApplicationController
  def index
    @jobs = Company.find_by(slug: params[:store_slug]).jobs
  end
end
