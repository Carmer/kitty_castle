class AddStatusToKitties < ActiveRecord::Migration
  def change
    add_column :kitties, :status, :string
  end
end
