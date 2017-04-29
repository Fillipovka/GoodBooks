class AddAttachmentPhotoArticleToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :photo_article
    end
  end

  def self.down
    remove_attachment :articles, :photo_article
  end
end
