class Item < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy
end
