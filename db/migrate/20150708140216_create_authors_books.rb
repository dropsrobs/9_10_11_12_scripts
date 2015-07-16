class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true

      t.timestamps null: false
    end
  end
end
