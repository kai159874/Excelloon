class CreateBalloons < ActiveRecord::Migration[6.1]
  def change
    create_table :balloons do |t|
      t.references  :user,          null: false, foreign_key: true
      t.string      :content,       null: false
      t.integer     :color_status,  null: false

      t.timestamps
    end
  end
end
