class CreateStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :stickers do |t|
      t.string :message, null: false

      t.timestamps
    end
  end
end
