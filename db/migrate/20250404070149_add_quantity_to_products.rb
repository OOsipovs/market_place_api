class AddQuantityToProducts < ActiveRecord::Migration[7.2]
  def change
    add_column :products, :quantity, :integer, default: 0
  end
end
