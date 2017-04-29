class CreateJoinTableCategoryBook < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :books do |t|
      t.index [:category_id, :book_id]
      t.index [:book_id, :category_id]
    end
  end
end
