class UserMailer < ApplicationMailer
  def new_booking(booking)
    @booking = booking
    @user = booking.user
    @tour = booking.tour
    @guide = @tour.guide
    @subject = "Tour - #{@tour.title} booked"

    mail(to: @guide.email, subject: @subject)
  end
end
