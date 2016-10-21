class Shoe < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one :buyer, through: :purchase, source: :user

  validates :name, :price, :user, presence: true

end
