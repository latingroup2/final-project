class AddNombreToSalas < ActiveRecord::Migration[5.1]
  def change
    add_column :salas, :nombre, :text
  end
end
