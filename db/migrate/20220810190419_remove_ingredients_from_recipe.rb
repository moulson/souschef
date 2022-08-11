class RemoveIngredientsFromRecipe < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :ingredients
  end
end
