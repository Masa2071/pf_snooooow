class CreateEventComments < ActiveRecord::Migration[5.2]
  def change
    create_table :event_comments do |t|
      t.integer    :user_id,  null: false
      t.integer    :event_id, null: false
      t.text       :content,  null: false
      t.timestamps
    end
  end
end
