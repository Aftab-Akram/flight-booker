class Airport < ApplicationRecord
  validates :name, uniqueness: true

  has_many :departing_flights, class_name: "Flight", foreign_key: "from_airport_id", dependent: :destroy
  has_many :arriving_flights, class_name: "Flight", foreign_key: "to_airport_id", dependent: :destroy
end
