class AvailabilitiesController < ApplicationController
  def index
    
    #Availability.upsert({})
    @dias_disponibles = []
    @horarios_disponibles = []
  end

  def obten_disponibilidad
    AvailabilityDetail.inicializa(params[:availability_id])
    @dias_disponibles = AvailabilityDetail.where(availability_id: params[:availability_id]).select("fecha").group("fecha").order(fecha: :asc)
    #byebug
    @horarios_disponibles = AvailabilityDetail.detalle_horario(params[:availability_id])
    
    #@num_ingenieros = 
    # @horarios = Hash.new
    # hora = ""
    # @horarios_disponibles.each do |hd|
    #   byebug
    #   if fecha != hd.fecha and fecha != ""

    #     fecha = hd.fecha
    #   else
    #     fecha = hd.fecha
    #   end


    #end

  end

  def semanas_por_servicio
      Availability.inicializa(params[:servicio])
    
      @disponibilidad = Availability.where(service_id: params[:servicio]).order(anio: :asc).order(semana: :asc)
      
      respond_to do |format|
        format.js
      end
    
  end
end
