class WeeklyPlan < ApplicationRecord
    has_many :meals, dependent: :delete_all
end
