class AddOpcion4ToEjercicios < ActiveRecord::Migration[5.1]
  def change
    add_column :ejercicios, :opcion4, :text
  end
end
