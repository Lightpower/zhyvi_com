class EventsController < ApplicationController
  require './app/presenters/events_presenter'
  include EventsPresenter

  include Adminable

  load_and_authorize_resource except: [:calendar, :create]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    authorize! :create, @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event - объект успешно создан.' }
        format.json { render action: 'show', status: :created, location: @event }
      else
        format.html { render action: 'new' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event - объект успешно изменён.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  # GET /events/calendar.json
  # It is accessible for all users including guests
  def calendar
    date = Date.parse(params[:start_date]) || Date.new
    events = Event.for_calendar(date).all
    render json: calendar_json(events), status: 200
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      binding.pry
      params.require(:event).permit(:type, :title, :preview, :data, :start_at, :finish_at, :user_id)
    end
end
