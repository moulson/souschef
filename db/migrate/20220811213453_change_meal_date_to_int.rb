class ChangeMealDateToInt < ActiveRecord::Migration[7.0]
  def change
    remove_column(:meals, :date)
    add_column(:meals, :date, :integer)
  end
end
