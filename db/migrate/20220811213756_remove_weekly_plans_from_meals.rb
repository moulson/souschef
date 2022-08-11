class RemoveWeeklyPlansFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_column(:meals, :weekly_plans_id)
  end
end
