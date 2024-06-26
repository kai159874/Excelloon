class CreateBalloonComments < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_comments do |t|
      t.references  :user,      null: false, foreign_key: true
      t.references  :balloon,   null: false, foreign_key: true
      t.string      :comment,   null: false

      t.timestamps
    end
  end
end
