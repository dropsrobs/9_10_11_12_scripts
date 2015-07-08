class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  validates :title, presence: true
  validates :edition, presence: true
  validates :edition, numericality: { only_integer: true }
  def name_with_initial
    "#{title}, #{edition}. edition"
  end
end
