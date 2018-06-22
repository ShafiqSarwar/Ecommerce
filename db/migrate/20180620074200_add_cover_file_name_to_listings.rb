class AddCoverFileNameToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :cover_filename, :string
  end
end
