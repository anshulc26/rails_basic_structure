class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :tour_id
      t.integer :number_of_people
      t.string :contact_email

      t.timestamps
    end
  end
end
