class Barcode < ApplicationRecord
  validates :inn, presence: true
  validates :index, presence: true
  validates :month, presence: true
  validates :start, presence: true
  validates :end, presence: true
end
