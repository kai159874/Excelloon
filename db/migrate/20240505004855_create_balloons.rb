class CreateBalloons < ActiveRecord::Migration[6.1]
  def change
    create_table :balloons do |t|
      t.integer   :user_id, null: false
      t.string    :content, null: false
      t.integer   :color_status, null: false

      t.timestamps
    end
  end
end
