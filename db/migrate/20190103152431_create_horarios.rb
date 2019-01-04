class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.time :entrada
      t.time :salida
      t.integer :user_id      
      t.timestamps
    end
  add_foreign_key :horarios, :users, column: :user_id, primary_key: :id    
  end
end
