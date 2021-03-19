class Recipe < ApplicationRecord
  validates :title, :content, presence: true
  before_save :prettify
  belongs_to :user

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true

  def prettify
    self.title = title.titleize
  end
end
