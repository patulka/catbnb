class Booking < ApplicationRecord
  belongs_to :cat
  belongs_to :user

  validates :date_from, :date_to, presence: true
end
