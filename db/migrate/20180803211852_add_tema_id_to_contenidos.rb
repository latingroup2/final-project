class AddTemaIdToContenidos < ActiveRecord::Migration[5.1]
  def change
    add_column :contenidos, :tema_id, :integer
  end
end
