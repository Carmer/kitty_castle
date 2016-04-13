class Reservation < ActiveRecord::Base
  belongs_to :kitty
  belongs_to :castle

  before_validation :sanitize_credit_card

  def self.complete
    where(complete: true)
  end

  def self.today
    where("created_at >= ?", Time.zone.now.beginning_of_day)
  end

  def self.newer_than(date)
    where("start_date > ?", date)
  end


private

  def sanitize_credit_card
    credit_card_number.gsub(/-|\s/,'')
  end
end
