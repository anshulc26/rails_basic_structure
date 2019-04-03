class User < ApplicationRecord
  rolify
  ratyrate_rater
  ratyrate_rateable "guide"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Relations
  has_many :tours, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
