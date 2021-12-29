class Availability < ApplicationRecord
  belongs_to :service

  validates :service_id, :semana, :anio, presence: {message: "no puede estar en blanco"}

  def self.inicializa(servicio) 
    fecha = Time.zone.now

    (0..5).each do |sem|
      semana = (fecha + sem.week).strftime("%U")
      anio = (fecha + sem.week).strftime("%Y")
      
      consulta = Availability.find_by(service_id: servicio, semana: semana, anio: anio)
      
      if consulta == nil
        Availability.create(service_id: servicio, semana: semana, anio: anio).save
      end
    end
  end
end
