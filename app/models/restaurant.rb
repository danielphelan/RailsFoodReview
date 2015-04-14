class Restaurant < ActiveRecord::Base
  geocoded_by :location
  before_save :geocode
  has_many :reviews, dependent: :destroy
  validates :address, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
   def location
    [name, address, 'Ireland'].compact.join(', ')
  end

   def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
     where("name like ?", "%#{query}%") 
    end
end
