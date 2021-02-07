class Ingredient < ApplicationRecord
  validates :name, :description, presence: true
end
