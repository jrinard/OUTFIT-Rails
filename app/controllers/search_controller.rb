class SearchController < ApplicationController

  def index
    @pictures = Picture.all
    # @photo = Picture.find(params[:picture_id])
    # tag = Event.find(params[:id])
    # @photoArray = tag.findTaggedPhotos
  end


end
