class AvailabilityDetail < ApplicationRecord
  belongs_to :availability
  belongs_to :engineer_availability

  validates :availability_id, :fecha, :hora_inicio, :engineer_availability_id, presence: {message: "no puede estar en blanco"}

end
