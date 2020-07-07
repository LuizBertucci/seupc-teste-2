class SavedNotebook < ApplicationRecord
  belongs_to :users
  belongs_to :notebooks
end
