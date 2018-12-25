class AgregarTipoatencionDescripcionAlMedicalrecords < ActiveRecord::Migration[5.2]
  def change
  	add_column :medical_records, :tipo_atencion, :string
  	add_column :medical_records, :descripcion, :string
  	add_column :medical_records, :hour_id, :integer

	add_foreign_key :medical_records, :hour_reservations, column: :hour_id, primary_key: :id 
  end
end
