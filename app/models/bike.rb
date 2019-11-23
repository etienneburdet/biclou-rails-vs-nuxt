class Bike < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address

  validates :name, presence: true, allow_blank: false
  validates :description, presence: true
  validates :price_per_hour, numericality: { only_integer: true }
end
