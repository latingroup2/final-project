class CreateEjes < ActiveRecord::Migration[5.1]
  def change
    create_table :ejes do |t|
      t.integer :materia_id
      t.text :description

      t.timestamps
    end
  end
end
