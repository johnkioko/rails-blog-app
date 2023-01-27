class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :AuthorId
      t.integer :PostId
      t.text :Text

      t.timestamps
    end
    add_foreign_key :comments, :users, column: :AuthorId, primary_key: :id
    add_index :comments, :AuthorId
    add_foreign_key :comments, :posts, column: :PostId, primary_key: :id
    add_index :comments, :PostId
  end
end
