class ReservationCompletion
  attr_accessor :reservation

  def initialize(reservation)
    @reservation = reservation
    create
  end

  def create
     if reservation.save
       send_reservation_confirmation
       set_kitty_to_active
     end
   end

  def send_reservation_confirmation
    ReservationMailer.reservation_confirmation(kitty).deliver
  end

  def set_kitty_to_active
    reservation.kitty.update_attributes(status: “active”)
  end
end
