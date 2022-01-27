class DeleteAttribute < ActiveRecord::Migration[6.1]
  def up
    remove_column :projects, :bug_id
  end
end
