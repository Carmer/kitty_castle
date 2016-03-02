class AddEmailToKitty < ActiveRecord::Migration
  def change
    add_column :kitties, :email, :string
  end
end
