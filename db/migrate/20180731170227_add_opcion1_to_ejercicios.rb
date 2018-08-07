class AddOpcion1ToEjercicios < ActiveRecord::Migration[5.1]
  def change
    add_column :ejercicios, :opcion1, :text
  end
end
