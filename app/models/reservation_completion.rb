class ReservationCompletion
  attr_accessor :reservation

  def initialize(reservation)
    @reservation = reservation
    create
  end

  def create
     send_reservation_confirmation
     set_kitty_to_active
  end

  def send_reservation_confirmation
    ReservationMailer.reservation_confirmation(reservation.kitty, reservation.castle).deliver
  end

  def set_kitty_to_active
    reservation.kitty.update_attributes(status: “active”)
  end
end
