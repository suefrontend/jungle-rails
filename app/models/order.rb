class Order < ApplicationRecord
  
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def total_quantity
    line_items.sum(:quantity)
  end

  def total_price
    line_items.inject(Money.new(0)) do |sum, line_item|
      sum + line_item.total_price
    end
  end

end
