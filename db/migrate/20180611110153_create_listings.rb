class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :name
      t.string :description
      t.string :adress

      t.timestamps
    end
  end
end
