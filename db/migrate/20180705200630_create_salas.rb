class CreateSalas < ActiveRecord::Migration[5.1]
  def change
    create_table :salas do |t|
      t.integer :profesor_id
      t.integer :colegio_id

      t.timestamps
    end
  end
end
