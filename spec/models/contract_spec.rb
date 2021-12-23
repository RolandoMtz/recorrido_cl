require 'rails_helper'

RSpec.describe Contract, type: :model do
  context 'validaciones de servicios' do
    it 'El servicio no puede estar vacio' do
      contrato = Contract.new(dia: 0, hora_inicio: "19:00").save
      expect(contrato).to eq(false)
    end

    it 'El dia no puede estar vacio' do
      contrato = Contract.new(service_id: 1, hora_inicio: "19:00").save
      expect(contrato).to eq(false)
    end

    it 'La hora no puede estar vacia' do
      contrato = Contract.new(service_id: 1, dia: 0).save
      expect(contrato).to eq(false)
    end
  end
end
