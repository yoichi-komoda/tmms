class Lift < ApplicationRecord
  belongs_to :menu
  acts_as_list scope: :menu
  
  validates :name, presence: true, length: { maximum: 20 }
  validates :set_count, presence: true, length: { maximum: 2 }
  validates :interval, presence: true, length: { maximum: 4 }
  validates :position, presence: true
  
  has_many :parts, dependent: :delete_all
end
