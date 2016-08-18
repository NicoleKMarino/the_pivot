class BucketJobsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_job, only: [:update, :destroy]

  def create
    job = Job.find(params[:job_id])
    @bucket.add_job(job.id)
    session[:bucket] = @bucket.contents
    flash[:success] = "#{job.title} added to bucket successfully. Bucket now contains #{pluralize(@bucket.total_jobs, 'job')}."
    redirect_to bucket_path(job) #request.referrer original redirect
  end

  def update
    @bucket.contents[params[:id].to_s] = params[:item][:quantity].to_i
    flash[:success] = "Quantity of #{@job.title} updated to #{params[:item][:quantity]}."
    redirect_to cart_index_path
  end

  def destroy
    @bucket.contents.delete(params[:id])
    flash[:success] = "Successfully removed #{view_context.link_to(@job.title, item_path(@job))} from your cart."
    redirect_to cart_index_path
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end
end
