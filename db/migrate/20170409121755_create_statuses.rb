class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
    	t.integer :book_id
    	t.integer :user_id
      t.index [:book_id, :user_id]
      t.index [:user_id, :book_id]
      t.boolean :read, default: false
      t.boolean :toRead, default: false
      t.boolean :favorite, default: false
      t.boolean :currentlyReading 
      t.timestamps
    end
  end
end
