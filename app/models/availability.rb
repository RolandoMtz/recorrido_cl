class Availability < ApplicationRecord
  belongs_to :service

  validates :service_id, :semana, :anio, presence: {message: "no puede estar en blanco"}
end
