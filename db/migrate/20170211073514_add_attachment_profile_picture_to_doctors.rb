class AddAttachmentProfilePictureToDoctors < ActiveRecord::Migration
  def self.up
    change_table :doctors do |t|
      t.attachment :profile_picture
    end
  end

  def self.down
    remove_attachment :doctors, :profile_picture
  end
end
