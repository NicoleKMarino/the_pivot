class AddIndustryRefToEmployers < ActiveRecord::Migration[5.0]
  def change
    add_reference :employers, :industry, foreign_key: true
  end
end
