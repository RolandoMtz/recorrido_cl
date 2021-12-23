require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'validaciones de servicios' do
    it 'Codigo no puede estar vacio' do
      servicio = Service.new(nombre: 'Monitoreo recorrido.cl').save
      expect(servicio).to eq(false)
    end

    it 'Codigo no puede repetirse' do
      servicio = Service.new(codigo: "0001", nombre: "Monitoreo recorrido.cl").save
      servicio2 = Service.new(codigo: "0001", nombre: "Monitoreo 2 recorrido.cl").save
      expect(servicio2).to eq(false)
    end
  end
end
