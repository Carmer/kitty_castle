class CreateCastles < ActiveRecord::Migration
  def change
    create_table :castles do |t|
      t.string :name
      t.string :location

      t.timestamps null: false
    end
  end
end
