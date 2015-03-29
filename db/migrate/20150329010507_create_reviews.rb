class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :restaurant
      t.string :title
      t.string :date
      t.string :loc_lat
      t.string :loc_long

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :date
  end
end
