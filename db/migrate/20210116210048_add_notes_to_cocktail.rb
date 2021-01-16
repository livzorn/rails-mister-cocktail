class AddNotesToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :method, :text
  end
end
