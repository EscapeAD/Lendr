class AddAttachmentPhotoToStoryPhotos < ActiveRecord::Migration
  def self.up
    change_table :story_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :story_photos, :photo
  end
end
