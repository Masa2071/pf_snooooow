class ChangeColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :birthday, to: nil
  end
end
