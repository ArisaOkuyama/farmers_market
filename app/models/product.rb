class Product < ApplicationRecord
    include PgSearch::Model 

    pg_search_scope :search, against: [:category_id, :state]
    
    has_one :category
    belongs_to :farmer
    has_one_attached :picture
    has_many :order_histories


end
