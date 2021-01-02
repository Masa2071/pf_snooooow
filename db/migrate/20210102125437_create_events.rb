class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer       :user_id,     null: false
      t.string        :title,       null: false
      t.text          :content,     null: false
      t.datetime      :etd,         null: false
      t.datetime      :eta,         null: false
      t.datetime      :preiod,      null: false
      t.integer       :recruitment, null: false
      t.string        :cost
      t.string        :destination
      t.timestamps
    end
  end
end
