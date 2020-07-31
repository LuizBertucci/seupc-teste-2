class Tag < ApplicationRecord
  has_many :taggings
  has_many :notebooks, through: :taggings
end
