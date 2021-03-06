class Flight < ApplicationRecord
  self.per_page = 10

  validates :flight_date, presence: true

  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  has_many :bookings, dependent: :destroy
end
