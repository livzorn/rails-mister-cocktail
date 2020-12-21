class Ingredient < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: true
end
