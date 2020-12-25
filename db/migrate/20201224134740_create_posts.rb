class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id,       null: false
      t.integer :post_image_id, null: false, default: 0
      t.text    :content,       null: false
      t.timestamps
    end
  end
end
