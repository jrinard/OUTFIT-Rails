class AdminController < ApplicationController

  def index
    @user = current_user
    @users = User.all
    @pictures = Picture.all

    @showlogin = false
    if params[:logout]
      @showlogin = true
    end

  end
end
