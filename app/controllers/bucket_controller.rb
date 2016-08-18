class BucketController < ApplicationController
  def index
    @applications = @bucket.all_items
  end
end
