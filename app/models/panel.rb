class Panel < ApplicationRecord
  has_many :purchases, dependent: :destroy

  validates :month, presence: true, uniqueness: true
  validates :year, presence: true
  validates :pay, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_default_year, on: :create
  after_create :copy_fixed_purchases

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "id", "id_value", "month", "pay", "updated_at", "year" ]
  end

  def set_default_year
    self.year = Date.current.year if year.blank?
  end

  private

  def previous_month_panel
    previous_month =
      if month == 1
        { month: 12, year: year - 1 }
      else
        { month: month - 1, year: year }
      end

    Panel.find_by(
      month: previous_month[:month],
      year: previous_month[:year]
    )
  end

  def copy_fixed_purchases
    previous_panel = previous_month_panel
    return unless previous_panel

    fixed_purchases = previous_panel.purchases.where(fixed: true)
    return if fixed_purchases.empty?
   
    previous_panel.purchases.where(fixed: true).find_each do |purchase|
      purchases.create!(
        description: purchase.description,
        value: purchase.value,
        bank: purchase.bank,
        fixed: true,
        date: Date.new(year, month, purchase.date.day)
      )
    end
  end
end