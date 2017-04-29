class ChangeBookTable < ActiveRecord::Migration[5.0]
  def change
	  change_table :books do |t|
		  t.remove :biography, :birthplace, :dateOfBirth
		  t.string :part_number
		  t.integer :paperback
		  t.string :editionLanguage
		end
	end
end
