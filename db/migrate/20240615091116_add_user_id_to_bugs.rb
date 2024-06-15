class AddUserIdToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :user_id, :integer
  end
end
