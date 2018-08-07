class CreateTemas < ActiveRecord::Migration[5.1]
  def change
    create_table :temas do |t|
      t.text :nombre

      t.timestamps
    end
  end
end
