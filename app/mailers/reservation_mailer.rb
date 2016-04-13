class ReservationMailer < ApplicationMailer::Base
  default from: "example@kittyCastle.com"

  def reservation_confirmation(kitty, castle)
    @kitty = kitty
    mail( to: @kitty.email,
          subject: "#{castle.name} - Reservation Conformation")
  end
end
