class ReservationsController < ApplicationController
  def create
    credit_card = reservation_params[:credit_card_number]
    credit_card = credit_card.gsub(/-|\s/,'')
    reservation_params[:credit_card_number] = credit_card

    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      flash[:notice] = "Reservation was created."
      ReservationMailer.reservation_confirmation(@reservation.kitty, @reservation.castle).deliver
      @reservation.kitty.update_attributes(status: “active”)
      redirect_to current_kitty
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:credit_card_number, :kitty_id, :castle_id, :start_date, :end_date )
  end
end
