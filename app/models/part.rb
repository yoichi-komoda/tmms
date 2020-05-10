class Part < ApplicationRecord
  belongs_to :lift
  
  validates :reps, presence: true, length: { maximum: 2 }
  validates :weight, presence: true, length: { maximum: 3 }
end
