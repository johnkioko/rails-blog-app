class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.text :Bio
      t.integer :PostCounter
      t.string :Image

      t.timestamps
    end
  end
end