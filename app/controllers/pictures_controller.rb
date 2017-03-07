class PicturesController < ApplicationController

# before_action :authenticate_user!

def index
  @user = current_user
  @pictures = @user.pictures
end

def show
   @picture = Picture.find(params[:id])
   if params[:get_task]
     @task_id = @picture.get_task
     @picture.update(:task_id => @task_id)
   end
   if params[:get_details]
     @details = @picture.get_details
   end
end

def new
  @picture = Picture.new
end

def create
   @user = current_user
   @picture = Picture.new(picture_params)
   if @picture.save
     flash[:notice] = "Picture Saved!"
     redirect_to pictures_path
   else
     render :new
   end
end

# def create
#    @user = current_user
#    @picture = Picture.new(picture_params)
#    respond_to do |format|
#    if @picture.save
#      format.html flash[:notice] = "Picture Saved!"
#      format.js
#     #  redirect_to pictures_path
#    else
#      format.html {render :new, notice: 'There was an error.'}
#      format.js { redirect_back(fallback_location: pictures_path, notice: 'There was an error.') }
#     end
#    end
# end

def edit
   @picture = Picture.find(params[:id])
   @user = current_user
end

def update
  @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      flash[:notice] = "Picture updated!"
      redirect_to pictures_path
    else
      render :edit
    end
  end

def destroy
end

def picture_params
   params.require(:picture).permit(:image, :title, :description, :url, :task_id, :user_id, :body, :legs, :feet, :hands, :head, :extra)
end



end
