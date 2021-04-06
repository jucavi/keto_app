class Recipe < ApplicationRecord
  include Searchable

  validates :title, :content, presence: true
  before_save :prettify

  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, reject_if: :all_blank, allow_destroy: true

  has_one_attached :image
  # with active storage validations
  validates :image, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  def prettify
    self.title = title.titleize
  end

  settings do
    mappings dynamic: false, analyzer: :english do
      indexes :title, type: :text
      indexes :content, type: :text
      indexes :ingredients, type: :object do
        indexes :name
      end
    end
  end

  # Customize the JSON serialization for Elasticsearch
  def as_indexed_json(options={})
    self.as_json(
      include: { ingredients: { only: :name} })
  end
end
