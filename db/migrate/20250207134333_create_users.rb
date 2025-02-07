class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.index :email, unique: true  
      t.string :password_digest

      t.timestamps
    end
  end
end
