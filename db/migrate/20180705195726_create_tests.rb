class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.integer :profesor_id

      t.timestamps
    end
  end
end
