class AddTorso < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :torso, :string
  end
end
