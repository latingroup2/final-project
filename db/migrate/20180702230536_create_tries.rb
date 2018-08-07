class CreateTries < ActiveRecord::Migration[5.1]
  def change
    create_table :tries do |t|
      t.integer :user_id
      t.integer :excercise_id
      t.string :user_answer
      t.boolean :correct
      t.boolean :active
      t.integer :intento_guia_id

      t.timestamps
    end
  end
end
