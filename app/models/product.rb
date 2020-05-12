class Product < ApplicationRecord
    belongs_to :farm
    has_one :category
    has_one_attached :picture
end
