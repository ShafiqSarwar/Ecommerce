class AddDonor < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :donor, :boolean, default: false
  end
end
