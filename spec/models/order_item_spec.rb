require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  xit { should belong_to :order }
  xit { should belong_to :item }
end
