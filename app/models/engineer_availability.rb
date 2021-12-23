class EngineerAvailability < ApplicationRecord
    has_many :availability_details

    validates :nombre, presence: {message: "no puede estar en blanco"}
    validates :nombre, uniqueness: {message: "%{value} ya se encuentra asignado"}
end
