class AddNombreToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :nombre, :text
  end
end
