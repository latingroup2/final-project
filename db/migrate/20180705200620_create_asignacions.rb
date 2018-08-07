class CreateAsignacions < ActiveRecord::Migration[5.1]
  def change
    create_table :asignacions do |t|
      t.integer :test_id
      t.integer :sala_id

      t.timestamps
    end
  end
end
