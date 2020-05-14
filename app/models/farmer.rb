class Farmer < ApplicationRecord
    has_many :products, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_one_attached :farmers_picture
    belongs_to :user
    has_many :favorite_farmers
    has_many :fav_user, through: :favorite_farmers, class_name: "User", foreign_key: "user_id"
end
