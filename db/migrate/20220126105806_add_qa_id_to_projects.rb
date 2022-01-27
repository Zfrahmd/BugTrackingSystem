class AddQaIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :qa_id, :int
  end
end
