class HomeController < ApplicationController

  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end
    @pictures = Picture.all

    if params[:fav]
      @picture = Picture.find(params[:fav])
      @picture.liked_by current_user
      @picture.update(:extra => "fav")
    end
  end

  def show
    @photoSearchResults = Picture.fuzzy_search(params[:title])
    @searchbydate = Picture.where "DATE(updated_at) = DATE(?)", params[:date]
  end
end
