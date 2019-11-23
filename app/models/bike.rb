class Bike < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true
  validates :price_per_hour, mumericality: { only_integer: true }
end
