class AddAttachmentPhotoBookToBooks < ActiveRecord::Migration
  def self.up
    change_table :books do |t|
      t.attachment :photo_book
    end
  end

  def self.down
    remove_attachment :books, :photo_book
  end
end
