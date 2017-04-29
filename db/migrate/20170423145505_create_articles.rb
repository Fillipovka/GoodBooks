class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title_article
      t.text :text_article

      t.timestamps
    end
  end
end
