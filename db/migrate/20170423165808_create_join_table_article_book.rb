class CreateJoinTableArticleBook < ActiveRecord::Migration[5.0]
  def change
    create_join_table :books, :articles do |t|
      t.index [:book_id, :article_id]
      t.index [:article_id, :book_id]
    end
  end
end
