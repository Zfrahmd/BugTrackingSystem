class AddUserIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :user_id, :int
  end
end
