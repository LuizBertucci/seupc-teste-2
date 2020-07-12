class Notebook < ApplicationRecord

  has_one_attached :photo

  validates :asis, presence: true, uniqueness: true
end
