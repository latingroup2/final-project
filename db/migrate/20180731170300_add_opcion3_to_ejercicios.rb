class AddOpcion3ToEjercicios < ActiveRecord::Migration[5.1]
  def change
    add_column :ejercicios, :opcion3, :text
  end
end
