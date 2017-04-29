class CreateJoinTableCategoryAuthor < ActiveRecord::Migration[5.0]
  def change
    create_join_table :categories, :authors do |t|
      t.index [:category_id, :author_id]
      t.index [:author_id, :category_id]
    end
  end
end
