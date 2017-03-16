class AdminController < ApplicationController

  def index
    @user = current_user
    @users = User.all

    @showlogin = false
    if params[:logout]
      @showlogin = true
    end

    @totalusercount = User.count

  end
end
