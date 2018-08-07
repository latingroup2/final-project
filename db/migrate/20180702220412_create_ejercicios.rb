class CreateEjercicios < ActiveRecord::Migration[5.1]
  def change
    create_table :ejercicios do |t|
      t.integer :contenido_id
      t.integer :dificultad
      t.string :imagen
      t.text :pregunta
      t.integer :indicador_id
      t.string :habilidad

      t.timestamps
    end
  end
end
