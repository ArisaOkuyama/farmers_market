class Product < ApplicationRecord
    has_one :category
    belongs_to :farmer
    has_one_attached :picture
end
