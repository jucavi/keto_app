class RecipeIngredient < ApplicationRecord
  validates :amount, :unit, presence: true

  belongs_to :recipe
  belongs_to :ingredient

  def ingredient_name
    Ingredient.find(self.ingredient_id).name
  end
end
