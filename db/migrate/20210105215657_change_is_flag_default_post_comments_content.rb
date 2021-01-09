class ChangeIsFlagDefaultPostCommentsContent < ActiveRecord::Migration[5.2]
  def up
    change_column :post_comments, :content,:text, default: nil
  end

  def down
    change_column :post_comments, :content,:text, default: ""
  end
end
