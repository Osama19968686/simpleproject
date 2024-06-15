class AddDescriptionToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :description, :text
  end
end
