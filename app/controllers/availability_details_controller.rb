class AvailabilityDetailsController < ApplicationController
  def prepara_edicion
    respond_to do |format|
        format.html { redirect_to editar_disponibilidad_url(params[:availability_id])}
    end    
  end

  def edit
    @disponibilidad = Availability.find_by(id: params[:id])
    @dias_disponibles = AvailabilityDetail.where(availability_id: params[:id]).select("fecha").group("fecha").order(fecha: :asc)
    @horarios_disponibles = AvailabilityDetail.detalle_horario(params[:id])
    @modifica = true
  end

  def update
    if !params["chkA"].present?
        return false, "Debe seleccionar al menos un horario"
    end

    params["chkA"].each do |check|
        detalle = AvailabilityDetail.find_by(id: check.to_i)
        detalle.disponible = true
        detalle.save
    end

    redirect_to availabilities_url
  end
end
