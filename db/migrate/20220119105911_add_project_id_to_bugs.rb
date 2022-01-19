class AddProjectIdToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :project_id, :int
  end
end
