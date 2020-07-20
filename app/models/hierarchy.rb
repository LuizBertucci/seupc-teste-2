class Hierarchy < ApplicationRecord
  def init
    self.admin ||= true
  end
end
