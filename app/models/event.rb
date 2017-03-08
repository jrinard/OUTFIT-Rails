class Event < ApplicationRecord
  belongs_to :picture

  validates :name, :presence => true

  # def findTaggedPhotos
  #   photos = Picture.all
  #   photoArray = []
  #   photos.each do |photo|
  #     photo.events.each do |tag|
  #       if tag.name == self.name
  #       photoArray.push(photo)
  #       end
  #     end
  #   end
  #   return photoArray
  # end

end
