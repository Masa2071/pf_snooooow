class ChangeColumnToNotNullIntroduction < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :introduction,:text, nill:true
  end

  def down
    change_column :users, :introduction,:text, nill:false
  end
end
