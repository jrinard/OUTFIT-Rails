class EventsController < ApplicationController

def index
  @events = Event.all

end

    def show
      @photo = Picture.find(params[:picture_id])
      tag = Event.find(params[:id])
      @photoArray = tag.findTaggedPhotos
    end

    def new
      @picture = Picture.find(params[:picture_id])
      # @event = Event.new(event_params)
      @event = @picture.events.new
      # @event = Event.new
    end

    def create
      @picture = Picture.find(params[:picture_id])
      @event = @picture.events.new(event_params)
      if @event.save
        flash[:notice] = "Event added!"
        redirect_to pictures_path
      else
        flash[:notice] = "Event not added!"
        render :new
      end
    end

    def edit
       @picture = Picture.find(params[:picture_id])
        @event = Event.find(params[:id])
      end

      def update
        @picture = Picture.find(params[:picture_id])
        @event = Event.find(params[:id])
        if @event.update(event_params)
          flash[:notice] = "Event updated!"
          redirect_to picture_path(@picture.id)
        else
          render :edit
        end
      end

    def destroy
      @picture = Picture.find(params[:picture_id])
      @event = Event.find(params[:id])
      @event.destroy
      flash[:notice] = "Event deleted!"
      redirect_to picture_path(@picture)
    end

  private
    def event_params
      params.require(:event).permit(:name)
    end
  end
