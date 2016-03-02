class Reservation < ActiveRecord::Base
  belongs_to :kitty
  belongs_to :castle
end
