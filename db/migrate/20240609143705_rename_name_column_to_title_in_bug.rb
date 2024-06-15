class RenameNameColumnToTitleInBugs < ActiveRecord::Migration[7.1]
  def change
    rename_column :bugs, :name, :title

  end
end
