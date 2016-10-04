class CreateStoryPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :story_photos do |t|
      t.references :story

      t.timestamps
    end
  end
end
