class CreateServices < ActiveRecord::Migration[6.1]
  def change
    create_table :services do |t|
      t.string :codigo, nullable: false
      t.string :nombre, nullabble: false

      t.timestamps
    end
  end
end
