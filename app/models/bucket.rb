class Bucket
  attr_reader :contents

  def initialize(contents)
    @contents = contents || {}
  end

  def add_job(job_id)
    @contents[job_id.to_s] ||= ""
  end

  def total_jobs
    contents.length
  end

  def total_cost
    if contents.empty?
      0.00
    elsif contents.values.max < 2
      Item.find(contents.keys).pluck(:price).sum
    else
      process_sum
    end
  end

  def all_items
    contents.map do |item_id, quantity|
      CartItem.new(item_id, quantity)
    end
  end

  private

  def process_sum
    all_items.reduce(0) do |initial, item|
      initial += item.sub_total
    end
  end

end
