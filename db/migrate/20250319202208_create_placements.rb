class CreatePlacements < ActiveRecord::Migration[7.2]
  def change
    create_table :placements do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
