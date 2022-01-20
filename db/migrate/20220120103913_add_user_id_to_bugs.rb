class AddUserIdToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :user_id, :int
  end
end
