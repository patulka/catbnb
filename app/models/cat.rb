class Cat < ApplicationRecord
  validates :name, :breed, :description, :color, :picutre_url, presence: true
  validates :age, presence: true, inclusion: 0..30

  belongs_to :user
  has_many :bookings

end
