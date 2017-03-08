class Event < ApplicationRecord
  belongs_to :picture

  validates :name, :presence => true

  def findEventPhotos
    pictures = Picture.all
    photoArray = []
    pictures.each do |photo|
      photo.events.each do |event|
        if event.name == self.name
        photoArray.push(photo)
        end
      end
    end
    return photoArray
  end

end
