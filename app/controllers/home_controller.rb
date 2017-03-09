class HomeController < ApplicationController

  def index
    @user = current_user
    @showlogin = false
    if params[:logout]
      @showlogin = true
    end
    @pictures = Picture.all
  end

  def show
    @photoSearchResults = Picture.basic_search(params[:title])
  end

end
