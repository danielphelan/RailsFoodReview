class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :restaurant
      t.string :location
      t.string :title
      t.string :date
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :date
  end
end
