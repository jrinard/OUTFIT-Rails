class HomeController < ApplicationController

def index
  @user = current_user

  # @users = User.all
  # if params[:upvote]
  #   @user = User.find(params[:upvote])
  #   @user.liked_by current_user
  # end

  @showlogin = false
  if params[:logout]
    @showlogin = true
  end

  @pictures = Picture.all
end

def new

end

def create

end

def show
  @pictureSearchResults = Picture.basic_search(params[:name])
end

end
