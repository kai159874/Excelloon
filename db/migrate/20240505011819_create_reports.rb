class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer   :reporter_id
      t.integer   :reported_id
      t.integer   :balloon_id

      t.timestamps
    end
  end
end
