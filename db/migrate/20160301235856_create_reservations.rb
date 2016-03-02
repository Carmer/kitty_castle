class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :kitty, index: true, foreign_key: true
      t.references :castle, index: true, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
  end
end
