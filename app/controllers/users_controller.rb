class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @pictures = @user.pictures
    # @events = @user.events
    # events = @user.events

    # Events are not destroyed yet
    if @user.pictures.destroy_all
       @user.destroy
       flash[:notice] = "User deleted!"
    redirect_to pictures_path
    else
      render :edit
      flash[:notice] = "Error User not Deleted"
    end
  end

end
