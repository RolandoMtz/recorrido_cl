require 'rails_helper'

RSpec.describe EngineerAvailability, type: :model do
  context 'validaciones de disponibilidad de ingenieros' do
    it 'nombre no puede estar vacio' do
      ingeniero = EngineerAvailability.new(disponibilidad: 10, color: "000000").save
      expect(ingeniero).to eq(false)
    end

    it 'nombre no puede repetirse' do
      servicio = Service.new(nombre: "Rolando Martinez").save
      servicio2 = Service.new(nombre: "Rolando Martinez").save
      expect(servicio2).to eq(false)
    end
  end
end
