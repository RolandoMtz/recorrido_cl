class AvailabilityDetail < ApplicationRecord
  belongs_to :availability
  belongs_to :engineer_availability

  validates :availability_id, :fecha, :hora_inicio, :engineer_availability_id, presence: {message: "no puede estar en blanco"}

  def self.inicializa(availability_id)
    disponibilidad = Availability.find_by(id: availability_id)
    ingenieros = EngineerAvailability.all

    detalle = AvailabilityDetail.where(availability_id: availability_id).count()
  
    if detalle == 0
      fecha_inicio = ((disponibilidad.anio.to_s + "-01-01").to_date + disponibilidad.semana.week).beginning_of_week(start_day = :sunday)
    
      (0..6).each do |dia|
        contratados = Contract.where(service_id: disponibilidad.service_id, dia: dia)
        fecha = fecha_inicio + dia.day
        contratados.each do |contrato|
          ingenieros.each do |ingeniero|
            AvailabilityDetail.create(availability_id: disponibilidad.id, fecha: fecha, hora_inicio: contrato.hora_inicio, engineer_availability_id: ingeniero.id)
          end
        end
      end
    end
  end

  def self.detalle_horario(disponibilidad_id)
    
    @horarios = AvailabilityDetail.where(availability_id: disponibilidad_id).order(hora_inicio: :asc).order(engineer_availability_id: :asc).order(fecha: :asc) 
    

  end
end
