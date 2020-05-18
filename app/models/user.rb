class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :reviews, dependent: :destroy
    has_one :farmer
<<<<<<< HEAD
    
=======
    has_one_attached :users_picture
>>>>>>> 00b96b0e4517856c6a48c53ec2774b477512a283
    has_many :favorite_farmers, dependent: :destroy
    has_many :fav_farmes, through: :favorite_farmers, class_name: "Farmer", source: :favorited
    has_many :order_history
end
