class AddFavoritesToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :favorite, :boolean
  end
end
