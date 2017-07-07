class ChangingDataTypeFlAndAdmin < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :admin, :boolean, default: false
    change_column :users, :floor_number, :integer
  end
end
