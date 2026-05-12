class Panel < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates :month, presence: true
  validates :year, presence: true
  validates :pay, numericality: { greater_than_or_equal_to: 0 }
end
