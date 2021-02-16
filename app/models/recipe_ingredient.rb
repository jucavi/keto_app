class RecipeIngredient < ApplicationRecord
  validates :amount, :unit, presence: true

  belongs_to :recipe
  belongs_to :ingredient
end
