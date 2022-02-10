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


  validates_with ProductValidator

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
