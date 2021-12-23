class CreateAvailabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :availabilities do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :semana, null: false
      t.integer :anio, null: false

      t.timestamps
    end
  end
end
