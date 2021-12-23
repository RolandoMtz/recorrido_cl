class Service < ApplicationRecord
    validates :codigo, presence: {message: "no puede estar en blanco"}
    validates :codigo, uniqueness: {message: "%{value} ya se encuentra asignada a otro servicio"}
end
