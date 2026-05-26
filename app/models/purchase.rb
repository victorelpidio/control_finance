class Purchase < ApplicationRecord
  belongs_to :bank
  belongs_to :panel

  validates :description, presence: true
  validates :value, presence: true
end
