class RemovePendienteFromIntentoTests < ActiveRecord::Migration[5.1]
  def change
    remove_column :intento_tests, :pendiente, :string
  end
end
