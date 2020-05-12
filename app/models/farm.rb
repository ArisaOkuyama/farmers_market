class Farm < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :reviews
    belongs_to :user, dependent: :destroy

    validates :user, presence: true

end
