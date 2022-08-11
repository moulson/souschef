class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.date :date, null: false
      t.references :weekly_plans, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.timestamps
    end
  end
end
