class AddDetailsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :details, :string
  end
end
