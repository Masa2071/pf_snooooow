class ChangeColumnUserProfile < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :profile_image_id,:string, default: nil
  end

  def down
    change_column :users, :profile_image_id,:string, default: "0"
  end
end
