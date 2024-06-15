class AddNameToBug < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :name, :string
  end
end
