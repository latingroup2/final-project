class CreateColegios < ActiveRecord::Migration[5.1]
  def change
    create_table :colegios do |t|
      t.text :nombre

      t.timestamps
    end
  end
end
