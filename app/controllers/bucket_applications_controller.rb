class BucketApplicationsController < ApplicationController
  include ActionView::Helpers::TextHelper
  before_action :set_item, only: [:update, :destroy]

  def create
    item = Item.find(params[:item_id])
    @bucket.add_item(item.id)
    session[:cart] = @bucket.contents
    flash[:success] = "#{item.title} added to cart successfully. Cart now contains #{pluralize(@bucket.total_items, 'item')}."
    redirect_to request.referrer
  end

  def update
    @bucket.contents[params[:id].to_s] = params[:item][:quantity].to_i
    flash[:success] = "Quantity of #{@application.title} updated to #{params[:item][:quantity]}."
    redirect_to cart_index_path
  end

  def destroy
    @bucket.contents.delete(params[:id])
    flash[:success] = "Successfully removed #{view_context.link_to(@application.title, item_path(@application))} from your cart."
    redirect_to cart_index_path
  end

  private

  def set_item
    @application = Item.find(params[:id])
  end
end
