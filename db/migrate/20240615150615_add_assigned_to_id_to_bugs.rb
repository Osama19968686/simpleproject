class AddAssignedToIdToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :assigned_to_id, :integer
  end
end
