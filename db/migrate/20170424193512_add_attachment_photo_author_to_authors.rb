class AddAttachmentPhotoAuthorToAuthors < ActiveRecord::Migration
  def self.up
    change_table :authors do |t|
      t.attachment :photo_author
    end
  end

  def self.down
    remove_attachment :authors, :photo_author
  end
end
