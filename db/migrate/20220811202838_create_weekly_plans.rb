class CreateWeeklyPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :weekly_plans do |t|
      t.date :start_date, null: false
      t.timestamps
    end
  end
end
