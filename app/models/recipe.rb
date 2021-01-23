class Recipe < ApplicationRecord
  validates :title, :content, presence: true
end
