class Reservation < ActiveRecord::Base
  belongs_to :kitty
  belongs_to :castle

  before_validation :sanitize_credit_card

private

  def sanitize_credit_card
    credit_card.gsub(/-|\s/,'')
  end
end
