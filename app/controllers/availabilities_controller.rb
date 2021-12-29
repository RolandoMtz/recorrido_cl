class AvailabilitiesController < ApplicationController
  def index
    @dias_disponibles = []
    @horarios_disponibles = []
  end

  def obten_disponibilidad
    AvailabilityDetail.inicializa(params[:availability_id])
    @dias_disponibles = AvailabilityDetail.where(availability_id: params[:availability_id]).select("fecha").group("fecha").order(fecha: :asc)
    @horarios_disponibles = AvailabilityDetail.detalle_horario(params[:availability_id])
  end

  def semanas_por_servicio
      Availability.inicializa(params[:servicio])
    
      @disponibilidad = Availability.where(service_id: params[:servicio]).order(anio: :asc).order(semana: :asc)
      
      respond_to do |format|
        format.js
      end
    
  end
end
