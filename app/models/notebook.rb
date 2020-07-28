class Notebook < ApplicationRecord

  has_one_attached :photo
  validates :asin, presence: true, uniqueness: true
  after_initialize :init
  
  acts_as_list column: :position, add_new_at: :bottom

  def init
    self.edited ||= false
  end

end
