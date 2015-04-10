class ChangeReviewColumn < ActiveRecord::Migration
  def self.up
    rename_column :reviews, :restaurant, :restaurant_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
