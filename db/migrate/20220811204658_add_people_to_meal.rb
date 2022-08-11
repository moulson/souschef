class AddPeopleToMeal < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :people, :integer
  end
end
