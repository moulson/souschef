class AddWeeklyPlanToMeal < ActiveRecord::Migration[7.0]
  def change
    add_reference :meals, :weekly_plan, null: false, foreign_key: true
  end
end
