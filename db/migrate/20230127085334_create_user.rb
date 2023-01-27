class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.integer :post_counter
      t.string :photo

      t.timestamps
    end
  end
end
