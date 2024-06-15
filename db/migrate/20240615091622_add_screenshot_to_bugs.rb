class AddScreenshotToBugs < ActiveRecord::Migration[7.1]
  def change
    add_column :bugs, :screenshot, :string
  end
end
