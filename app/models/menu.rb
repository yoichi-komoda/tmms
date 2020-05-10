class Menu < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true, length: { maximum: 10 }
  
  has_many :lifts, -> { order(position: :asc) }, dependent: :destroy
end
