class StoryPhoto < ApplicationRecord
  belongs_to :story
  do_not_validate_attachment_file_type :photo
  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
