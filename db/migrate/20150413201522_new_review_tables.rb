class NewReviewTables < ActiveRecord::Migration
  def change
    remove_column :reviews, :location
    add_column :reviews, :comeback, :string
  end
end
