class ChangeIsFlagDefaultIntroduction < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :introduction,:text, default: nil
  end

  def down
    change_column :users, :introduction,:text, default: ""
  end
end
