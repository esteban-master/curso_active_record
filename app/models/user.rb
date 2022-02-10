# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  # agregar el nombre del modelo en plural
  has_many :shopping_carts 

  # agregar el modelo en singular
  has_one :shopping_cart
end
