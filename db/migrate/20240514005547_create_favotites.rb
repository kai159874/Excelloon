class CreateFavotites < ActiveRecord::Migration[6.1]
  def change
    create_table :favotites do |t|
      t.references  :user,      null: false, foreign_key: true
      t.references  :balloon,   null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
