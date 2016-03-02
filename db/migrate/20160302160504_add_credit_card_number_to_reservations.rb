class AddCreditCardNumberToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :credit_card_number, :string
  end
end
