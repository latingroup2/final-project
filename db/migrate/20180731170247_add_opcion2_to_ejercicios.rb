class AddOpcion2ToEjercicios < ActiveRecord::Migration[5.1]
  def change
    add_column :ejercicios, :opcion2, :text
  end
end
