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
    @searchbydate = Picture.where "DATE(created_at) = DATE(?)", params[:date]
  end
end
# a = Picture.find_by_id(1)
# a.created_at = '2017-01-11 01:36:41'
# a.save
