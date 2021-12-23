class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :service, null: false, foreign_key: true
      t.integer :dia, null: false
      t.time :hora_inicio, null: false

      t.timestamps
    end
  end
end
