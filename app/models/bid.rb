class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validate :bid_before_auciton_end

  private

  def bid_before_auciton_end
    if item.end_time.present? && Time.current > item.end_time
      errors.add(:base, "Cannot place a bid after the auction has ended")
    end
  end
end
