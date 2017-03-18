class PicturesController < ApplicationController

def index
  @user = current_user
  @pictures = @user.pictures.order(id: :desc)
  @showdetail = false
  if params[:showdetail]
    @showdetail = true
  end

  @showlogin = false
  if params[:logout]
    @showlogin = true
  end

  if params[:fav]
    @picture = Picture.find(params[:fav])
    @picture.liked_by current_user
    @picture.update(:extra => "fav")
  end
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
    render :new, notice: 'There was an error.'
   end
end

def edit
   @picture = Picture.new
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
  @picture = Picture.find(params[:id])
  if @picture.events.destroy_all
    @picture.destroy
  flash[:notice] = "Outfit has been deleted!"
  redirect_to pictures_path
  else
    render :edit
  end
end

def picture_params
   params.require(:picture).permit(:image, :title, :description, :url, :task_id, :user_id, :body, :legs, :feet, :hands, :head, :extra, :favorite)
end

end
