class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy # when you delete a cocktail, associated doses are deleted
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
end
# rails generate model Doses description cocktail:references ingredient:references
