class RenameNameToTitleInBugs < ActiveRecord::Migration[6.0]
  def change
    rename_column :bugs, :name, :title
  end
end
