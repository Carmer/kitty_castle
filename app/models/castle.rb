class Castle < ActiveRecord::Base
  has_many :reservations
  has_many :kitties, through: :reservations
end
