class AddFloorNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :floor_number, :string
    add_column :users, :remember_digest, :string
  end
end
