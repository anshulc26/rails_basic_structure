class Booking < ApplicationRecord
  ## Relations
  belongs_to :user
  belongs_to :tour

  ## Validations
  validates :number_of_people, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :contact_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
