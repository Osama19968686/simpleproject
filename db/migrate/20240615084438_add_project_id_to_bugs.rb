class AddProjectIdToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :project_id, :integer
  end
end
