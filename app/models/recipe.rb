class Recipe < ApplicationRecord
  validates :title, :content, presence: true

  belongs_to :user, dependent: :destroy
end
