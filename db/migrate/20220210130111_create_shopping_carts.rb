class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :total, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
