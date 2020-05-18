class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :reviews, dependent: :destroy
    has_one :farmer
    has_one_attached :users_picture
    has_many :favorite_farmers, dependent: :destroy
    has_many :fav_farmes, through: :favorite_farmers, class_name: "Farmer", source: :favorited
    has_many :order_history

    validates :first_name, presence: true, length: { maximum: 20 }   
    validates :last_name, presence: true, length: { maximum: 20 }   
    validates :state, presence: true
    validates :address, presence: true, length: { maximum: 100 }   
    validates :phone, presence: true,  length: { maximum: 15 }   

end
