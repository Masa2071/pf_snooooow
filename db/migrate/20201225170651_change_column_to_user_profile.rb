class ChangeColumnToUserProfile < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :post_image_id, to: nil
  end
end
