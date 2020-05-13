class Farmer < ApplicationRecord
    has_many :products
    has_many :reviews
    has_one_attached :farmers_picture
    belongs_to :user
end
