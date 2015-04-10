class Restaurant < ActiveRecord::Base
  geocoded_by :location
  after_validation :geocode
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
   def location
    [name, address, 'Ireland'].compact.join(', ')
  end
end
