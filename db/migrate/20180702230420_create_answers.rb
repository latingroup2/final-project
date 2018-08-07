class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :right_answer
      t.text :wrong_1
      t.text :wrong_2
      t.text :wrong_3
      t.text :wrong_4
      t.integer :excercise_id

      t.timestamps
    end
  end
end
