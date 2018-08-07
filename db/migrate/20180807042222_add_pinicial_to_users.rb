class AddPinicialToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pinicial, :integer
  end
end
