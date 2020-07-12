class Notebook < ApplicationRecord

  has_one_attached :photo

  validates :asin, presence: true, uniqueness: true


  after_initialize :init

  def init
    self.edited ||= false
  end

end
