class Reservation < ActiveRecord::Base
  belongs_to :kitty
  belongs_to :castle

  before_validation :sanitize_credit_card

  scope :complete,   -> { where(complete: true) }

  scope :today,      -> { where("created_at >= ?",
                         Time.zone.now.beginning_of_day) }

  scope :newer_than, ->(date) { where("start_date > ?", date) }
private

  def sanitize_credit_card
    credit_card.gsub(/-|\s/,'')
  end
end
