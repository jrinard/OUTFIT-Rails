class FavoriteController < ApplicationController


  before_action :authenticate_user!

 def index
   @user = current_user
   @pictures = Picture.all.where(extra: "fav")

   @showdetail = false
   if params[:showdetail]
     @showdetail = true
   end

   @showlogin = false
   if params[:logout]
     @showlogin = true
   end

   if params[:unfav]
     @picture = Picture.find(params[:unfav])
     @picture.liked_by current_user
     @picture.update(:extra => "nil")
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
      render :new
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
     if @picture.destroy
     flash[:notice] = "Picture deleted!"
     redirect_to pictures_path
   else
     render :edit
   end
 end


 def picture_params
    params.require(:picture).permit(:image, :title, :description, :url, :task_id, :user_id, :body, :legs, :feet, :hands, :head, :extra)
 end

end
