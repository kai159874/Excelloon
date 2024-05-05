class CreateBalloonComments < ActiveRecord::Migration[6.1]
  def change
    create_table :balloon_comments do |t|
      t.integer   :user_id
      t.integer   :balloon_id
      t.string    :comment,     null: false

      t.timestamps
    end
  end
end
