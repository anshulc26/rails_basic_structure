class ToursController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_guide, except: [:index, :show, :booking]

  def index
    @search = Tour.includes(:guide).all.ransack(params[:q])
    @search.sorts = 'title asc' if @search.sorts.empty?

    @tours = @search.result.page(params[:page]).per(params[:per_page] || 10)
  end

  def show
    get_tour(Tour)
  end

  def booking
    get_tour(Tour)
    @booking = current_user.bookings.new
  end

  def new
    @tour = current_user.tours.new
  end

  def create
    @tour = current_user.tours.new(tour_params)
    if @tour.save
      flash[:notice] = "Successfully created."
      redirect_to my_tours_path
    else
      render :new
    end
  end

  def edit
    get_tour(current_user.tours)
  end

  def update
    get_tour(current_user.tours)
    if @tour.update_attributes(tour_params)
      flash[:notice] = "Successfully updated."
      redirect_to my_tours_path
    else
      render :edit
    end
  end

  def destroy
    get_tour(current_user.tours)
    if @tour.destroy
      flash[:notice] = "Successfully deleted."
    else
      flash[:error] = "An error occurred while trying to delete the tour."
    end
    redirect_to my_tours_path
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :description, :location, :start_date, { photos: [] })
  end

  def get_tour(base)
    @tour = base.find_by(id: params[:id])
    unless @tour.present?
      redirect_to my_tours_path
    end
  end
end
