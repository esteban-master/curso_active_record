class ProductValidator < ActiveModel::Validator

  def validate(record)
    if record.stock < 0
      record.errors.add(:stock, "Ponte vio, pone algo positivo")
    end
  end

  

end