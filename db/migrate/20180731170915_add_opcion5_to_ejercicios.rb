class AddOpcion5ToEjercicios < ActiveRecord::Migration[5.1]
  def change
    add_column :ejercicios, :opcion5, :text
  end
end
