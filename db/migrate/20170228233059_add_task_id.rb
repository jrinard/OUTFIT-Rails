class AddTaskId < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :task_id, :integer
  end
end
