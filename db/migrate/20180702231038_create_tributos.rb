class CreateTributos < ActiveRecord::Migration[5.1]
  def change
    create_table :tributos do |t|
      t.text :contenido_name
      t.integer :contenido_id
      t.text :indicador_name
      t.integer :indicador_id

      t.timestamps
    end
  end
end
