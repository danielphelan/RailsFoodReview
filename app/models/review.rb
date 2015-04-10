class Review < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  belongs_to :user
  belongs_to :restaurant

  def address
    [restaurant, location, 'Ireland'].compact.join(', ')
  end
end
