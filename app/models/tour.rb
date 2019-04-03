class Tour < ApplicationRecord
  ratyrate_rateable "tour"

  ## Relations
  belongs_to :guide, foreign_key: 'user_id', class_name: User.to_s

  ## Validations
  validates :title, :description, :location, :photos, :start_date, presence: true

  ## Uploaders
  mount_uploaders :photos, PhotoUploader
end
