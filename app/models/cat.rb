class Cat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :breed, :description, :color, :picture_url, :city, presence: true
  validates :age, presence: true, inclusion: 0..30

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?  

end
