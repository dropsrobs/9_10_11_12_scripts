class Book < ActiveRecord::Base
  has_many :authors, through: :authors_books
  has_many :authors_books
  validates :title, presence: true
  validates :edition, presence: true
  validates :edition, numericality: { only_integer: true }
  def name_with_initial
    "#{title}, #{edition}. edition"
  end

  def has_single_author?
    self.authors.count == 1 ? true : false
  end
end
