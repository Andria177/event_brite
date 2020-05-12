class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  def index
    @events = Event.all
  end

  def show
    puts @participants = Attendance.users(@event)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.admin = current_user

      if @event.save
        redirect_to @event, flash: {success: "Vous avez cree un nouvel evenement" }
      else
         render :new
      end
  end

  def update

    if @event.update(event_params)
      redirect_to @event, flash: {success: "Votre evenement a ete modifie avec succes" } 
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
     redirect_to events_url, flash: {danger: "Votre evenement a ete detruit avec succes" }     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      begin
        @event = Event.find(params[:id])
      rescue
        redirect_to events_path, flash: {danger: "Cet evenement n'existe pas !"}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
        return params.require(:event).permit(:title, :description, :location, :price, :duration, :start_date)
    end
end
