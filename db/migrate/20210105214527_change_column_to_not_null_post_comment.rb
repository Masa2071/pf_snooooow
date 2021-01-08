class ChangeColumnToNotNullPostComment < ActiveRecord::Migration[5.2]
  def up
    change_column_null :post_comments, :content, true
  end

  def down
    change_column_null :post_comments, :content, false
  end
end
