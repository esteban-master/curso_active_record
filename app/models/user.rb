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
  # por defecto has_one de shopping_cart, nos permite obtener el primer elemento del listado de shopping_carts
  # Al colocar una condicion con una fn lambda, esta se va a aplicar sobre la lista(relacion) shopping_carts
  # Se lee asi: 
    # Sobre el listado de carritos de compra que posee el usuario, queremos obtener todos aquellos carritos cuyo atributo 'active' sea igual a 'true'
  # Usando has_one, solo obtenemos 1 elemento, que seria el 1er carrito de compras que cumpla con la condicion
  has_one :shopping_cart, -> { where( active: true ).order('id DESC') }
end
