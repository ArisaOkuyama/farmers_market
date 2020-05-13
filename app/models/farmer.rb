class Farmer < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_one_attached :farmers_picture
    belongs_to :user
end
