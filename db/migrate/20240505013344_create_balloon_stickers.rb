class CreateBalloonStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_stickers do |t|
      t.references  :sticker,   null: false, foreign_key: true
      t.references  :balloon,   null: false, foreign_key: true
      t.integer     :quantity,  null: false

      t.timestamps
    end
  end
end
