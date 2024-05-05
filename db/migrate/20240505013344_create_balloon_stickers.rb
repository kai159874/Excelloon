class CreateBalloonStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_stickers do |t|
      t.integer   :user_id
      t.integer   :balloon_id
      t.integer   :quantity,  null: false

      t.timestamps
    end
  end
end
