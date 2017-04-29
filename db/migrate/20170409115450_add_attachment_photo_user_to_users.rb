class AddAttachmentPhotoUserToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :photo_user
    end
  end

  def self.down
    remove_attachment :users, :photo_user
  end
end
