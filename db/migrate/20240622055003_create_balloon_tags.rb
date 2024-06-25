class CreateBalloonTags < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_tags do |t|
      t.references :balloon, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    
    add_index :balloon_tags, [:balloon_id, :tag_id], unique: true
  end
end
