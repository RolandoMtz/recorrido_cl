class AddConfirmadoToAvailabilityDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :availability_details, :confirmado, :boolean, default: 0
  end
end
