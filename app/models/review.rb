class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :title, presence: true
  validates :details, presence: true
  validates :comeback, presence: true

 
end
