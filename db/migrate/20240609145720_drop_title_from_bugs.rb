class DropTitleFromBugs < ActiveRecord::Migration[7.1]
  def change

    remove_column :bugs, :title
  end
end
