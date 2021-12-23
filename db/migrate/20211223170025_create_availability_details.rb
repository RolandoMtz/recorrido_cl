class CreateAvailabilityDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :availability_details do |t|
      t.references :availability, null: false, foreign_key: true
      t.date :fecha
      t.time :hora_inicio
      t.references :engineer_availability, null: false, foreign_key: true
      t.boolean :disponible

      t.timestamps
    end
  end
end
