class AddFavoriteBooksTable < ActiveRecord::Migration[5.0]
  def change
  	create_table :favorite_books do |t|
      t.integer :user_id
      t.integer :book_id
    	
      t.index [:book_id, :user_id]
      t.index [:user_id, :book_id]

      t.timestamps
    end
  end
end
