require 'rails_helper'

RSpec.describe Availability, type: :model do
  context 'validaciones de disponibilidad' do
    it 'El servicio no puede estar vacio' do
      disponible = Availability.new(semana: 50, anio: 2021).save
      expect(disponible).to eq(false)
    end

    it 'La semana no puede estar vacia' do
      disponible = Availability.new(service_id: 1, anio: 2021).save
      expect(disponible).to eq(false)
    end

    it 'El año no puede estar vacio' do
      disponible = Availability.new(service_id: 1, semana: 50).save
      expect(disponible).to eq(false)
    end
  end
end
