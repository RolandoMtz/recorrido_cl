class Contract < ApplicationRecord
  belongs_to :service

  validates :service_id, :dia, :hora_inicio, presence: {message: "no puede estar en blanco"}
end
