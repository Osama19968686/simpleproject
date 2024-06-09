class CreateBugs < ActiveRecord::Migration[7.1]
  def change
    create_table :bugs do |t|

      t.timestamps
    end
  end
end
