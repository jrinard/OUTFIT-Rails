class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def destroy
    @user = User.find(params[:id])
    @pictures = @user.pictures

    # Events are not destroyed yet
    # @user.events.destroy_all
    @user.events.update(:picture_id => nil)
    if @user.events === nil

    end


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
