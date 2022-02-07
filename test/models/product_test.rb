# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  title      :string
#  code       :string
#  stock      :integer          default(0)
#  price      :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
