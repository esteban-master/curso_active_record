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
class Product < ApplicationRecord
  
  after_save :send_notification
  
  validates :title, presence: { message: "Teni que poner un titulo tonto qlo jajaja" }
  validates :code, uniqueness: { message: "El code %{value} ya esta en uso pajaron" }
  
  # validaciones propias
  validate :code_validate_length

  # Validaciones con clases perzonalizadas
  validates_with ProductValidator

  # Scopes, sentencias preestablecidas de consultas, se adjuntan al Modelo como un metodo, usando una funcion lamba
  # Ejemplo -> Product.available
  scope :available, ->  ( min = 1 )  { where(  'stock >= ?', min  ) }
  scope :order_price_desc, -> { order(  'price DESC'  ) }
  
  # Scope a partir de otros scopes
  scope :available_order_price_desc, ->  { available.order_price_desc }

  # Scope usando metodos de clase
  def self.top_5
    self.available.order_price_desc.limit(5).select(:title, :code)
  end

  private
  
  def code_validate_length
    if self.code.nil? || self.code.length < 3
      self.errors.add(:code, "Probando solamente!")
    end
  end

  def send_notification
    puts "Nuevo producto agregado: #{self.title}"
  end

end
