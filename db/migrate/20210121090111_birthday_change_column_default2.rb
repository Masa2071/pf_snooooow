class BirthdayChangeColumnDefault2 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :birthday, from: 1995, to: "1997-01-01"
  end
end
