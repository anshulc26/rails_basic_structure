class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_guide, only: :my_tours

  def my_tours
    @search = current_user.tours.includes(:guide).all.ransack(params[:q])
    @search.sorts = 'title asc' if @search.sorts.empty?

    @tours = @search.result.page(params[:page]).per(params[:per_page] || 10)
  end

  def booking
    @tour = Tour.find_by(id: params[:id])
    if @tour.present?
      booking = current_user.bookings.new(booking_params)
      if booking.save
        UserMailer.new_booking(booking).deliver_later
        flash[:notice] = "Successfully booked."
      else
        flash[:error] = "An error occurred while trying to book the tour."
      end
    end
    redirect_to tours_path
  end

  private

  def booking_params
    params.require(:booking).permit(:tour_id, :number_of_people, :contact_email)
  end
end
