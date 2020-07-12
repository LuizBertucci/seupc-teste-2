class Notebook < ApplicationRecord

  has_one_attached :photo

  validates :asin, presence: true, uniqueness: true
end
