class Kitty < ActiveRecord::Base
  has_many :reservations
  has_many :castles, through: :reservations
end
