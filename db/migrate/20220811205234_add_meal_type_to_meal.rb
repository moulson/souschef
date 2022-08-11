class AddMealTypeToMeal < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :meal_type, :integer
  end
end
