class Cat < ApplicationRecord
  validates :name, :breed, :description, :color, presence: true

  belongs_to :user
  has_many :bookings

end
