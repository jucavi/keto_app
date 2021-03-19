class Ingredient < ApplicationRecord
  validates :name, :description, presence: true
  before_save :prettify

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def prettify
    self.name = name.titleize
  end
end
