class ChangeNameOfUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :name, :string, null: false, default: ""
    change_column :users, :birthday, :string, null: false, default: "非公開"
  end

  def down
    change_column :users, :name, :string, null: false
    change_column :users, :birthday, :string, null: false
  end
end
