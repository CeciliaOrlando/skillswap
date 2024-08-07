class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] # se permite el acceso público a las acciones index y show sin autenticación.
  before_action :set_event, only: [:show, :edit, :update, :destroy] # se ejecuta el método set_event antes de las acciones show, edit, update y destroy.
  # localhost:3000/events
  def index
    @events = Event.order(event_date: :desc).where("event_date > ?", Date.today)
    @events_sucediendo = Event.order(event_date: :desc).where(event_date: Date.today)
    @events_caducados = Event.order(event_date: :desc).where("event_date < ?", Date.today)
     # devuelve la coleccion de todas las instancias de Events en la base de datos y me lo asigna en la variable de instancia @events.
  end
  # localhotst:3000/events/1
  def show
  end
  # localhost:3000/events/new
  def new
    @event = Event.new # Crea una nueva instancia de Event y la asigna a la variable de instancia @event.
  end
  # localhost:3000/events/1/edit
  def edit
  end
  # localhost:3000/events
  def create
    @event = Event.new(event_params) # se crea una instancia de Event utilizando los parametros permitidos en event_params
    @event.user = current_user # se asigna al usuario actual(current_user)como propietario del evento
    if @event.save # si se guarda correctamente en la base de datos es Verdadero
      redirect_to @event, notice: '¡Evento creado exitosamente!' # redirecciona a la vista del evento
    else # pero si hay error vuelve al formulario asi corrije el error
      render :new, status: :unprocessable_entity
    end
  end
  # localhost:3000/events/1
  def update
    if @event.update(event_params)
      respond_to do |format|
        format.html { redirect_to @event, notice: '¡Evento actualizado exitosamente!' }
        format.turbo_stream
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end
  # localhost:3000/events/1
  def destroy
    @event.destroy
    redirect_to events_path, status: :see_other # elimina el evento de la base de datos
  end
  private
  def event_params
    params.require(:event).permit(:name, :description, :event_date, :price, :status) # son los campos que estan permitidos para cear o modificar en eventos en la base de datos
  end
  def set_event
    @event = Event.find(params[:id])
  end
end
