class Notebook < ApplicationRecord
  include PgSearch::Model

  has_one_attached :photo
  has_many_attached :pictures

  validates :asin, presence: true, uniqueness: true
  after_initialize :init

  acts_as_list column: :position, add_new_at: :bottom

  has_many :taggings
  has_many :tags, through: :taggings

  def price_count
    array = [self.amazon_price, self.submarino_price, self.magalu_price, self.americanas_price ]
    counter = 0

    array.each do |price|
      counter += 1 if price.chars.count > 4 unless price.nil?
    end

    counter
  end

  private

  def init
    self.edited ||= false
  end



  pg_search_scope :search_query,
    against: [ :amazon_price, :magalu_price, :americanas_price, :submarino_price,
               :brand, :modelo, :processor, :color, :screen_size, :ram,
               :hd, :ssd, :placa_video, :name],
    using: {
      tsearch: { prefix: false, any_word: false} # <-- now `superman batm` will return something!
    }

end
