class Farmer < ApplicationRecord
    
    has_many :products, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_one_attached :farmers_picture
    belongs_to :user
    has_many :favorite_farmers


    validates :farm_name, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :state, presence: true
    validates :address, presence: true
    validates :farmers_picture, presence: true


    def full_name
        "#{first_name}  #{last_name}"
    end
end
