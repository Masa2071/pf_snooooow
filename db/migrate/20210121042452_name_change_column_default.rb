class NameChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :name, from: "", to: "名無し"
  end
end
