class CreateRecipeIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_ingredients do |t|
      t.float :quantity
      t.belongs_to :recipe
      t.belongs_to :ingredient
    end
  end
end
