class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :code
      t.integer :stock, default: 0
      t.integer :price, default: 0

      t.timestamps
    end
  end
end
