class UpdateReviewTables < ActiveRecord::Migration
  def up
    remove_column :reviews, :latitude
    remove_column :reviews, :longitude
  end

  
end
