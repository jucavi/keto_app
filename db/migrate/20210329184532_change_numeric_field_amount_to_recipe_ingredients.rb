class ChangeNumericFieldAmountToRecipeIngredients < ActiveRecord::Migration[6.1]
  def change
    change_column :recipe_ingredients, :amount, :decimal, precision: 5, scale: 2
  end
end
