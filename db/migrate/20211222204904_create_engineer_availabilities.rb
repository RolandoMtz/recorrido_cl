class CreateEngineerAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :engineer_availabilities do |t|
      t.string :nombre, nullable: false
      t.integer :disponibilidad, nullable: false, default: 0
      t.string :color

      t.timestamps
    end
  end
end
