class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.integer     :user_id,  null: false
      t.integer     :post_id,  null: false
      t.text        :content,  null: false, default: ""
      t.string      :image_id
      t.timestamps
    end
  end
end
