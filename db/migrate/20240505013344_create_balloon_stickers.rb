class CreateBalloonStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_stickers do |t|
      t.integer     :sticker_id,   null: false
      t.references  :balloon,   null: false, foreign_key: true
      t.integer     :quantity,  null: false

      t.timestamps
    end
  end
end
