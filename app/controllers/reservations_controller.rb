class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      ReservationCompletion.new(@reservation)
      flash[:notice] = "Reservation was created."
      redirect_to current_kitty
    else
      render :new
    end
  end

  def index
    @complete   = Reservation.complete
    @today      = Reservation.today
    @newer_than = Reservation.newer_than(params[:date])
  end

  private

  def reservation_params
    params.require(:reservation).permit(:credit_card_number, :kitty_id, :castle_id, :start_date, :end_date )
  end
end
