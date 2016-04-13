class Reservation < ActiveRecord::Base
  belongs_to :kitty
  belongs_to :castle

  before_validation :sanitize_credit_card
  after_create :send_order_confirmation
  after_save :set_kitty_to_active

private

  def sanitize_credit_card
    credit_card.gsub(/-|\s/,'')
  end

  def send_reservation_confirmation
    ReservationMailer.reservation_confirmation(kitty, castle).deliver
  end

  def set_kitty_to_active
    kitty.update_attributes(status: “active”)
  end
end
