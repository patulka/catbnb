class Cat < ApplicationRecord
  validates :name, :breed, :description, :color, :picture_url, :city, presence: true
  validates :age, presence: true, inclusion: 0..30

  belongs_to :user
  has_many :bookings

end
