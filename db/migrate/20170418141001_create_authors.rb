class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :lName
      t.string :fName
      t.text :biography
      t.string :birthplace
      t.date :dateOfBirth
      t.timestamps
    end
  end
end
