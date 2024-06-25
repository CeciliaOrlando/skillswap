class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show] # se permite el acceso público a las acciones index y show sin autenticación.
  before_action :set_event, only: [:show, :edit, :update, :destroy] # se ejecuta el método set_event antes de las acciones show, edit, update y destroy.

  def index
    @events = Events.all # devuelve la coleccion de todas las instancias de Events en la base de datos y me lo asigna en la variable de instancia @events.
  end

  def show
  end

  def new
    @event = Event.new  # Crea una nueva instancia de Event y la asigna a la variable de instancia @event.
  end

  def edit
  end

  def create
    @event = Event.new(event_params) # se crea una instancia de Event utilizando los parametros permitidos en event_params
    @event.user = current_user # se asigna al usuario actual(current_user)como propietario del evento
    if @event.save # si se guarda correctamente en la base de datos es Verdadero
      redirect_to @event # redirecciona a la vista del evento
    else # pero si hay error vuelve al formulario asi corrije el error
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event = Event.update(event_params) # ntenta actualizar los atributos   de la academia con los parámetros permitidos por academy_params.
      redirect_to @event # si actualizacion es correcta redireciona a la vista del evento
    else # pero si hay error vuelve al formulario asi corrije el error
       render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy # elimina el evento de la base de datos
    redirect_to events_path, status: :see_other, notice: "Evento eliminado con éxito!" # redirecciona a la vista de eventos y pone un mensaje de que se eliminó ok
  end

  private

  def event_params # por convencion es set_nombre del Modelo
    params.require(:event).permit(:name, :description, :date, :price, :status) # son los campos que estan permitidos para cear o modificar en eventos en la base de datos
  end

  def set_event
    @event = Event.find(params[:id])
  end
end