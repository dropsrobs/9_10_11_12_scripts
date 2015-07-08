class Author < ActiveRecord::Base
  has_many :books, through: :authors_books
  has_many :authors_books
  validates :name, presence: true
  validates :surname, presence: true
  def name_with_initial
    "#{name} #{surname}"
  end
end
