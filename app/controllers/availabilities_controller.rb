class AvailabilitiesController < ApplicationController
  def index
    @dias_disponibles = []
    @horarios_disponibles = []
  end

  def confirmar
    #cuentas_total = AvailabilityDetail.where(availability_id: 1).count
    cuentas = AvailabilityDetail.where(availability_id: params[:availability_id], disponible: true).group(:engineer_availability_id).count(:engineer_availability_id)
    cuentas = cuentas.sort_by(&:last)
    cuentas.each do |cuenta|
      disponibles = AvailabilityDetail.where(availability_id: params[:availability_id], disponible: true, engineer_availability_id: cuenta[0], confirmado: false)

      disponibles.each do |dispo|
        revisa = AvailabilityDetail.where(availability_id: params[:availability_id], fecha: dispo.fecha, hora_inicio: dispo.hora_inicio, confirmado: true).count

        if revisa == 0
          actualiza = AvailabilityDetail.find_by(id: dispo.id)
          actualiza.confirmado = true
          actualiza.save
        end
      end
    end
    redirect_to horarios_url
  end

  def horarios
    @dias_disponibles = []
    @horarios_disponibles = []
  end

  def obten_disponibilidad
    AvailabilityDetail.inicializa(params[:availability_id])
    @dias_disponibles = AvailabilityDetail.where(availability_id: params[:availability_id]).select("fecha").group("fecha").order(fecha: :asc)
    @horarios_disponibles = AvailabilityDetail.detalle_horario(params[:availability_id])
  end

  def obten_horario
    @dias_disponibles = AvailabilityDetail.where(availability_id: params[:availability_id]).select("fecha").group("fecha").order(fecha: :asc)
    @horarios_disponibles = AvailabilityDetail.detalle_horario_confirmado(params[:availability_id], true)
  end

  def semanas_por_servicio
      Availability.inicializa(params[:servicio])
    
      @disponibilidad = Availability.where(service_id: params[:servicio]).order(anio: :asc).order(semana: :asc)
      
      respond_to do |format|
        format.js
      end
    
  end
end
