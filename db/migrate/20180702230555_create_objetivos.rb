class CreateObjetivos < ActiveRecord::Migration[5.1]
  def change
    create_table :objetivos do |t|
      t.integer :eje_id
      t.text :descripcion
      t.integer :numeral

      t.timestamps
    end
  end
end
