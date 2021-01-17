class RenameMethodToNotes < ActiveRecord::Migration[6.0]
  def change
    rename_column :cocktails, :method, :notes
  end
end
