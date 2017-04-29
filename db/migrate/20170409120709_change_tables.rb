class ChangeTables < ActiveRecord::Migration[5.0]
  def change
  	change_table :users do |t|
		  t.string :surname
		  t.date :dateOfBirth
		  t.string :gender
		  t.string :city
		  t.string :country
		  t.text :aboutMe
		  t.text :interests
		end

		remove_column :books, :part_number
  end
end
