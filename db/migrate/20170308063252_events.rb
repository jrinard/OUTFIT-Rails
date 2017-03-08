class Events < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :picture_id
    end
  end
end
