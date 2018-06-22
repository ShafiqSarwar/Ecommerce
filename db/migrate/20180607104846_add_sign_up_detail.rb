class AddSignUpDetail < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :username, :string
  	add_column :users, :organization_name, :string
  	add_column :users, :organization_adress, :string
	add_column :users, :organization_adress2, :string
	add_column :users, :city, :string
	add_column :users, :state, :string
	add_column :users, :zip, :string

  end
end
