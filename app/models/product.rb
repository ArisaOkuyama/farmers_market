class Product < ApplicationRecord
    has_one :category
    belongs_to :farmer
    has_one_attached :picture
    has_many :order_histories
end
