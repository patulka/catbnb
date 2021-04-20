class Cat < ApplicationRecord
  belong_to :user
  validates :name, :breed, :description, presence: true
end
