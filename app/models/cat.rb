class Cat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :breed, :description, :color, :city, presence: true
  validates :age, presence: true, inclusion: 0..30
  validates :picture_url, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?  

  include PgSearch::Model
  pg_search_scope :search_by_cat_info,
    against: [ :name, :breed, :color, :city, :description, :age ],
    using: { tsearch: { prefix: true } }
end
