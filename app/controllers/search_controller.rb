class SearchController < ApplicationController

  def index
    @pictures = Picture.all

  end

end
