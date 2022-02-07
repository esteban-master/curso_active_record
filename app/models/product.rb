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
  def send_notification
    puts "Que pasa oe #{self.title}? after"
  end

end
