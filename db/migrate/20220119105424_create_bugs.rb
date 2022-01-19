class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :bug_type
      t.integer :feature_status
      t.integer :bug_status
      t.datetime :deadline
      t.timestamps
    end
  end
end
