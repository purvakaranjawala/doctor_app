class AddAttachmentProfilePictureToPatients < ActiveRecord::Migration
  def self.up
    change_table :patients do |t|
      t.attachment :profile_picture
    end
  end
  
  def self.down
    remove_attachment :patients, :profile_picture
  end
end
