class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books, id: false do |t|
      t.integer :author_id
      t.integer :book_id

      t.timestamps null: false
    end
  end
end
