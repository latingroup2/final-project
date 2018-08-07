class CreateIntentoTests < ActiveRecord::Migration[5.1]
  def change
    create_table :intento_tests do |t|
      t.integer :test_id
      t.integer :user_id

      t.timestamps
    end
  end
end
