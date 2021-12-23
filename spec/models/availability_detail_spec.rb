require 'rails_helper'

RSpec.describe AvailabilityDetail, type: :model do
  context 'validaciones de detalle de disponibilidad' do
    Availability.create(service_id: 1, semana: 50, anio: 2021).save
    EngineerAvailability.create(nombre: "Barbara", disponibilidad:19, color: "Azul").save

    it 'La disponibilidad no puede estar vacio' do
      disponibilidad_det = AvailabilityDetail.new(fecha: "2020-12-23", hora_inicio: "2000-01-01 10:00:00", engineer_availability_id: 1).save
      expect(disponibilidad_det).to eq(false)
    end

    it 'La fecha no puede estar vacia' do
      disponibilidad_det = AvailabilityDetail.new(availability_id: 1, hora_inicio: "2000-01-01 10:00:00", engineer_availability_id: 1).save
      expect(disponibilidad_det).to eq(false)
    end

    it 'La hora no puede estar vacia' do
      disponibilidad_det = AvailabilityDetail.new(availability_id: 1, fecha: "2020-12-23", engineer_availability_id: 1).save
      expect(disponibilidad_det).to eq(false)
    end

    it 'El ingeniero no puede estar vacio' do
      disponibilidad_det = AvailabilityDetail.new(availability_id: 1, fecha: "2020-12-23", hora_inicio: "2000-01-01 10:00:00").save
      expect(disponibilidad_det).to eq(false)
    end
  end
end
