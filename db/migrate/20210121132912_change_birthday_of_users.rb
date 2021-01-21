class ChangeBirthdayOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :birthday, :date, default: '1997-01-01'
  end

  def down
    change_column :users, :birthday, :date
  end
end
