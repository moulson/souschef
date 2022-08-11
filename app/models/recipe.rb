class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_one_attached :photo
end
