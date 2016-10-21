class Purchase < ApplicationRecord
  belongs_to :shoe
  belongs_to :user

  validates :shoe, :user, presence: true
  validates :shoe, uniqueness: true

end
