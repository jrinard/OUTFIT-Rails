class AddFieldsForEdit < ActiveRecord::Migration[5.0]
  def change
      add_column :pictures, :body, :string
      add_column :pictures, :legs, :string
      add_column :pictures, :feet, :string
      add_column :pictures, :hands, :string
      add_column :pictures, :head, :string
      add_column :pictures, :extra, :string
  end
end
