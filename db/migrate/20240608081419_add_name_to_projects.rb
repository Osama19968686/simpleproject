class AddNameToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :name, :string
  end
end
