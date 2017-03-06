class AddFilesToPictures < ActiveRecord::Migration[5.0]
  def change
      add_attachment :pictures, :image
  end
end
