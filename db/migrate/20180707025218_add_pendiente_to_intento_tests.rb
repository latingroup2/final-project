class AddPendienteToIntentoTests < ActiveRecord::Migration[5.1]
  def change
    add_column :intento_tests, :pendiente, :integer
  end
end
