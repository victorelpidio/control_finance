class Panel < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates :month, presence: true
  validates :year, presence: true
  validates :pay, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_default_year, on: :create

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "month", "pay", "updated_at", "year" ]
  end

  def set_default_year
    self.year = Date.current.year if year.blank?
  end
end