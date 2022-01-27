class AddDeveloperIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :dev_id, :int
  end
end
