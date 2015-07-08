class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :name, presence: true
  validates :surname, presence: true
  def name_with_initial
    "#{name} #{surname}"
  end
end
