class Notebook < ApplicationRecord

  has_one_attached :photo
  has_many_attached :pictures

  validates :asin, presence: true, uniqueness: true
  after_initialize :init
  
  acts_as_list column: :position, add_new_at: :bottom

  has_many :taggings
  has_many :tags, through: :taggings

  def init
    self.edited ||= false
  end

  def price_count
    array = [self.amazon_price, self.submarino_price, self.magalu_price, self.americanas_price ]
    counter = 0

    array.each do |price|
      counter += 1 if price.chars.count > 4 unless price.nil?
    end

    counter
  end

end
