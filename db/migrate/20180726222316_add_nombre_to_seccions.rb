class AddNombreToSeccions < ActiveRecord::Migration[5.1]
  def change
    add_column :seccions, :nombre, :text
  end
end
