class AddBugIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :bug_id, :int
  end
end
