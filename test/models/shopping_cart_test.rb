# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  total      :integer          default(0)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ShoppingCartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
