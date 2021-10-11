class Booking < ApplicationRecord
  has_many :passengers, dependent: :destroy
  belongs_to :user
  belongs_to :flight

  accepts_nested_attributes_for :passengers, reject_if: :all_blank, allow_destroy: true

  enum status: {
    active: 0,
    cancel: 1
  }
end
