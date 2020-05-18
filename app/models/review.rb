class Review < ApplicationRecord
    belongs_to :user
    belongs_to :farmer
    
    validates :comment, presence: true, length: { maximum: 150 }   
    validates :rating, presence: true
end
