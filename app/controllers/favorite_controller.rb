class FavoriteController < ApplicationController

  before_action :authenticate_user!

 def index
   @user = current_user
   @pictures = @user.pictures.where(extra: "fav")

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
end
