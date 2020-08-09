class SuperTag < ApplicationRecord
  has_many :super_taggings
  has_many :tags, through: :super_taggings  

  

end
