class ReservationCompletion

  def create(reservation)
     send_reservation_confirmation(reservation)
     set_kitty_to_active(reservation)
  end

  def send_reservation_confirmation(reservation)
    ReservationMailer.reservation_confirmation(reservation.kitty, reservation.castle).deliver
  end

  def set_kitty_to_active(reservation)
    reservation.kitty.update_attributes(status: “active”)
  end
end
