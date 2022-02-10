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
class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :shopping_cart_products
end
